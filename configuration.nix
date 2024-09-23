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
    extraSpecialArgs = { inherit inputs; };
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
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    qtspim # For cmsc411
    julia_19-bin # For cmsc460
    vimPlugins.julia-vim # For cmsc460
    bc # Terimal calculator
    dooit # Tui app for todo's. Very slow, switch at some point.
    dprint # Rust formater 
    firefox # Manage js, css in home-manager
    fish # Bash alternative
    gimp-with-plugins # Image manipulation
    # jre8 # Java Runtime Env, Add to languages
    kitty # Terminal emulator, move to Home-manager soon
    ncdu # Disk Utility
    neovim # Add to home-manager
    vim # Have vim by default
    waybar # Add to home-manager
    rofi-wayland # rofi-wayland 
    dunst # Notification daemon
    libnotify
    lunarvim # Neovim with good defaults
    neovide # Smooth GUI for neovim, move to home-manager
    networkmanagerapplet # NetworkMangager
    blueman #Bluetooth, add to bluetooth.nix
    git 
    vimPlugins.clangd_extensions-nvim # add to vim plugins
    obs-studio # recording software
    stow #dotfile management
    valgrind-light # for cmsc216, add to shell
    gnumake # for cmsc216, add to shell
    killall # command for killing processes (remove?)
    vimPlugins.completion-nvim # add to vim plugins
    starship # fish prompt
    vesktop # better discord + vencord client
    cargo # rust build tool
    pokemonsay # Pokemon in terminal with message (remove?)
    lsd #sylized ls
    cowsay # dependency for pokemonsay
    btop # better top, check system info
    lazygit # fast git management
    gtk4 #gtk client for themes
    mesa # ???
    gtk3 # gtk client for themes
    python3 # python
    nemo # file manager, cinomman
    cmake # For cmsc216, add to devshell
    libgcc # for cmsc216, add to devshell
    gcc13 # for cmsc216, add to devshell
    rust-analyzer # Rust lsp server
    catppuccin-gtk # Catpuccin-gtk theme, set to pink
    catppuccin-qt5ct
    catppuccin-kvantum
    swww # Wallpaper daemon
    waypaper # Wallpaper picker for wayland
    # vimPlugins.telescope-lsp-handlers-nvim
    # texliveMedium
    wlogout # move to home-manager
    nixfmt-rfc-style
    qt6.qtwayland
    swappy
    glib
    nwg-look
    dconf
    home-manager
    beauty-line-icon-theme
    oreo-cursors-plus
    spotify
    xdg-desktop-portal-hyprland
    catppuccin-sddm
    unzip
    libsForQt5.sddm
    kdePackages.sddm
    libreoffice-qt
    adwaita-qt
    # texlab
    grim
    slurp
    swappy
    font-awesome
    zathura
    wl-clipboard-rs
    clang-tools
  ];

   # services.xserver.enable = true;
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

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
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
