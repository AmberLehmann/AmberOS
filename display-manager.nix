{ pkgs, ...}:

{
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  # services.displayManager.sddm.theme = "catppuccin-sddm";
  # services.xserver.displayManager.sddm.package = pkgs.libsForQt5.sddm;
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    font  = "Noto Sans";
    fontSize = "9";
    background = "${./wallpapers/nix-black-4k.png}";
    loginBackground = true;
    }
  )];
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    wayland.enable = true;
    # package = pkgs.kdePackages.sddm;
  };
  services.xserver.displayManager.sddm.package = pkgs.libsForQt5.sddm;
}

