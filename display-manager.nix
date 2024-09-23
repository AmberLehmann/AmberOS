{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    (catppuccin-sddm.override {
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
    package = pkgs.kdePackages.sddm;
  };
}

