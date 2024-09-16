{ pkgs, ...}:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";
  # services.xserver.displayManager.sddm.package = pkgs.libsForQt5.sddm;
}

