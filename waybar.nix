{ ... }:

{
    programs.waybar = {
        enable = true;
        settings = {
        primary = {
        mode = "dock";
        height = 24;
        margin = "8 8 0 8";
        spacing = 0;
        modules-left = [ "custom/menu" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
            "tray"
            "pulseaudio"
            "cpu"
            "memory"
            "temperature"
        ];
        "hyprland/workspaces" = {
            "format" = "{icon}";
            "on-click" = "activate";
            "format-icons"= {
                "empty" = "";
                "urgent" = "";
                "active" = "";
                "default" = "";
            };
            "persistent-workspaces" = { "*" = 10; };
        };
        "clock" = {
            "format" = "<span> </span>{:%m/%d %H:%M}";
            "tooltip-format" = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "cpu"= {
            "interval" = 10;
            "format" = "󰍛 {}%";
            "max-length" = 10;
        };
        "memory" = {
            "interval" = 30;
            "format" = "mem {}%";
            "max-length" = 10;
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = ["" "" "" "" ""];
        };

        "tray" = {
            "spacing" = 0;
        };

        "custom/menu" = {
          "format" = "";
          "on-click" = "rofi -show drun";
        };

        "pulseaudio" = {
            "scroll-step" = 5;
            "format" = "{icon}  {volume}%";
            "format-muted" = "   0%";
            "format-icons" = {
              "headphone" = "";
              "headset" = "";
              "portable" = "";
              "default" = [ "" "" "" ];
            };
            "on-click" = "pavucontrol";
        };
      };
    };

    style = ''

    * {
      font-family: JetBrainsMono Nerd Font;
      font-size: 14pt;
      padding: 0 6px;
      color: #ffcff8;
    }
    tooltip {
        padding: 0;
        border: 2px solid transparent;
        border-radius: 18px;
        background-color: alpha(#1c1c1c, 0.7);
    }

    /* Clear default GTK styling. */
    tooltip * {
        padding: 0;
        margin: 0;
        border: none;
        border-radius: inherit;
        background-color: transparent;
    }

    /* Tooltip Text Box */
    tooltip label {
        padding: 8px;
    }
    .modules-right {
        margin-right: -15px;
    }
    .modules-left {
      margin-left: -15px;
    }
    window#waybar {
      color: #ff9aef;
      background-color: transparent;
      opacity: 0.98;
      padding: 0;
      border-radius: 10px;
    }
    window#waybar.bottom {
    }
 
    #workspaces button {
      padding: 0 3px;
      color: #7984A4;
      background-color: transparent;
      box-shadow: inset 0 -3px transparent;
      border: none;
      border-radius: 0;
    }
    #workspaces button.hidden {
      background-color: #002635;
      color: #869696;
    }
    #workspaces button.focused {
      color: #bf616a;
    }

    #workspaces button.active {
      color: #6a92d7;
    }

    #workspaces button.urgent {
      background-color: #eb4d4b;
    }
    
    #clock {
      padding-left: 15px;
      padding-right: 15px;
      margin-top: 0;
      margin-bottom: 0;
      border-radius: 5px;
    }

    #tray {
      color: #a1a19a;
    }

    #custom-menu {
      font-size: 16pt;
      background-color: transparent;
      color: #ff9aef;
      padding-left: 15px;
      padding-right: 22px;
      margin-left: 0;
      margin-right: 6px;
      margin-top: 0;
      margin-bottom: 0;
      border-radius: 10px;
    }

    #temperature.critical {
      font-weight: bold;
    }


    '';
    };
}

