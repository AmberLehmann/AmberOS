{ ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
          "label" = "lock";
          "action" = "swaylock";
          "text" = "Lock";
          "keybind" = "l";
      }

      {
          "label" = "logout";
          "action" = "hyprctl dispatch exit 0";
          "text" = "Logout";
          "keybind" = "e";
      }

      {
          "label" = "suspend";
          "action" = "swaylock -f && systemctl suspend";
          "text" = "Suspend";
          "keybind" = "u";
      }

      {
          "label" = "shutdown";
          "action" = "systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "s";
      }

      {
          "label" = "hibernate";
          "action" = "systemctl hibernate";
          "text" = "Hibernate";
          "keybind" = "h";
      }

      {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
      }
    ];
    style = ''
      @define-color bar-bg rgba(26,27,38,0);
      @define-color main-bg rgba(26,27,38,0.8);
      @define-color main-fg rgba(210,176,240,0.8);
      @define-color wb-act-bg rgba(202,123,167,0.4);
      @define-color wb-act-fg rgba(255,204,232,1);
      @define-color wb-hvr-bg rgba(84,75,125,0.4);
      @define-color wb-hvr-fg rgba(170,172,240,0.8);
      * {
          background-image: none;
          font-size: 30px;
      }

      window {
          background-color: transparent;
      }

      button {
          color: rgba(250, 170, 220, 0.9);
          background-color: @main-bg;
          outline-style: none;
          border: none;
          border-width: 2px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 10%;
          border-radius: 30px;
          box-shadow: none;
          text-shadow: none;
          animation: gradient_f 20s ease-in infinite;
      }

      button:focus {
          background-color: @wb-act-bg;
          background-size: 30%;
      }

      button:hover {
          background-color: @wb-hvr-bg;
          background-size: 40%;
          border-radius: 30px; 
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
      }

      button:hover#lock {
          border-radius: 10px;
          margin : 10px 0px 10px 10px;
      }

      button:hover#logout {
          border-radius: 10px;
          margin : 3px 0px 3px 0px;
      }

      button:hover#suspend {
          border-radius: 10px;
          margin : 3px 0px 3px 0px;
      }

      button:hover#shutdown {
          border-radius: 3px;
          margin : 3px 0px 3px 0px;
      }

      button:hover#hibernate {
          border-radius: 3px;
          margin : 3px 0px 3px 0px;
      }

      button:hover#reboot {
          border-radius: 3px;
          margin : 3px 3px 3px 0px;
      }
    '';
  };
}
