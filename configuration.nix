{
  inputs,
  pkgs,
  # lib,
  ...
}:

{
  # Home-manager 
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      amber = import ./home.nix;
    };
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amber = {
    isNormalUser = true;
    description = "amber";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    firefox
    qtspim
    waybar
    dprint
    bc
    ncdu
    rofi-wayland
    neovim
    gimp-with-plugins
    kitty
    dunst
    libnotify
    neovide
    jre8
    networkmanagerapplet
    blueman
    git
    vimPlugins.clangd_extensions-nvim
    obs-studio
    stow
    valgrind-light
    gnumake
    killall
    lunarvim
    fish
    # vimPlugins.completion-nvim
    starship
    vesktop
    cargo
    pokemonsay
    todo
    lsd
    cowsay
    btop
    lazygit
    gtk4
    gtk3
    python3
    cmake
    libgcc
    gcc13
    # rust-analyzer
    catppuccin-gtk
    catppuccin-qt5ct
    catppuccin-kvantum
    swww
    waypaper
    # vimPlugins.telescope-lsp-handlers-nvim
    texliveMedium
    wlogout
    nixfmt-rfc-style
    qt6.qtwayland
    swappy
    glib
    nwg-look
    dconf
    home-manager
    beauty-line-icon-theme
    oreo-cursors-plus
    tokyonight-gtk-theme
    spotify
    xdg-desktop-portal-hyprland
    catppuccin-sddm
    unzip
    libsForQt5.sddm
    kdePackages.sddm
    libreoffice-qt
    adwaita-qt
    texlab
    grim
    slurp
    swappy
    font-awesome
    zathura
    wl-clipboard-rs
    clang-tools
  ];

   # services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  # services.xserver.displayManager.sddm.package = pkgs.libsForQt5.sddm;
  programs.hyprland.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    jetbrains-mono
    cascadia-code
  ];
  programs.fish.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common.default = "*";
  };

}
