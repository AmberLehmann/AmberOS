{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    ly
  ];
  services.displayManager.sddm = {
    enable = false;
    theme = "where_is_my_sddm_theme";
    wayland.enable = true;
    # package = pkgs.kdePackages.sddm;
  };
  services.displayManager.ly = {
    enable = true;
    package = pkgs.ly;
    settings = {
      # allow_empty_password = false; # dangerous?
      animation = "colormix"; # "doom", "matrix", "colormix"
      animation_timeout_sec = 300; # 5 minutes
      auth_fails = 3; # special animation looks broken?
      bg = "0x02000000";
      # bigclock = "en"; # enlarges the clock -- may not work with some fonts?
      # blank_box = false; # transparent
      border_fg = "0x01FFFFFF";
      box_title = "null"; # text above the box
      clear_password = true;
      clock = "%B, %A %d @ %H:%M:%S";
      colormix_col1 = "0x08FF0000";
      colormix_col2 = "0x0800FF00";
      colormix_col3 = "0x080000FF";
      default_input = "password";
      error_bg = "0x02000000";
      error_fg = "0x01FF0000";
      fg = "0x01FFFFFF";
      hide_borders = true;
      hide_version_string = true; # doesnt work?
      hide_key_hints = true;
      initial_info_text = "null"; # hostname
      # input_len = 69;
      lang = "en";
      load = true;
      margin_box_h = 0;
      margin_box_v = 0;
      min_refresh_delta = 100; # milliseconds -- default=5
      # numlock = true;
      save = true;
      text_in_center = false; # ugly
      # tty = 4; # broken? -- could help with UWSM sessions
      # vi_default_mode = "insert";
      # vi_mode = true;
      # ...
    };
  };
}

