{pkgs, ...}: 

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = $mainMod ALT, S, movetoworkspacesilent, special
    '';
  };

}
