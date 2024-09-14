{
  config,
  pkgs,
  # inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "amber";
  home.homeDirectory = "/home/amber";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "Pink";
      variant = "Macchiato";
    })
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-folders
    fira-code
    fira-code-symbols
    font-awesome
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    proggyfonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "CodeNewRoman"
        "FantasqueSansMono"
        "Iosevka"
        "ShareTechMono"
        "Hermit"
        "JetBrainsMono"
        "FiraCode"
        "FiraMono"
        "Hack"
        "Hasklig"
        "Ubuntu"
        "UbuntuMono"
      ];
    })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/amber/etc/profile.d/hm-session-vars.sh
  programs.neovim = 
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      extraPackages = with pkgs; [
        lua-language-server

        xclip
        # wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./nvim/plugin/lsp.lua;
        }

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

      #   {
      #     plugin = gruvbox-nvim;
      #     config = "colorscheme gruvbox";
      #   }

        neodev-nvim

        nvim-cmp 
        {
          plugin = nvim-cmp;
          config = toLuaFile ./nvim/plugin/cmp.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ./nvim/plugin/telescope.lua;
        }

        telescope-fzf-native-nvim

        cmp_luasnip
        cmp-nvim-lsp

        luasnip
        friendly-snippets


        lualine-nvim
        nvim-web-devicons

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
          ]));
          config = toLuaFile ./nvim/plugin/treesitter.lua;
        }

        vim-nix

      #   # {
      #   #   plugin = vimPlugins.own-onedark-nvim;
      #   #   config = "colorscheme onedark";
      #   # }
      ];

      # extraLuaConfig = ''
      #   ${builtins.readFile ./nvim/options.lua}
      # '';

    # extraLuaConfig = ''
    #   ${builtins.readFile ./nvim/options.lua}
    #   ${builtins.readFile ./nvim/plugin/lsp.lua}
    #   ${builtins.readFile ./nvim/plugin/cmp.lua}
    #   ${builtins.readFile ./nvim/plugin/telescope.lua}
    #   ${builtins.readFile ./nvim/plugin/treesitter.lua}
    #   ${builtins.readFile ./nvim/plugin/other.lua}
    # '';
  }; 
  #Add support for ./local/bin
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  imports = [
    ./waybar.nix
    ./wlogout.nix
    ./zathura.nix
  ];
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home = {
    # EDITOR = "emacs";
    # GTK_THEME = "catppuccin-macchiato-pink-standard";
    sessionVariables = {
      XCURSOR_THEME = "oreo_spark_light_pink_bordered_cursors";
      XCURSOR_SIZE = "18";
      HYPRCURSOR_THEME = "oreo_spark_light_pink_bordered_cursors";
      HYPRCURSOR_SIZE = "18";
    };
  };

  # Let Home Manager install and manage itself. programs.home-manager.enable = true;


  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-pink-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "standard";
        variant = "macchiato";
      };
    };
    font = {
      name = "FiraCode";
      package = pkgs.fira-code-symbols;
      size = 11;
    };
    cursorTheme.package = pkgs.oreo-cursors-plus;
    cursorTheme.name = "oreo_spark_light_pink_bordered_cursors";
    iconTheme.package = pkgs.beauty-line-icon-theme;
    iconTheme.name = "BeautyLine";
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk2";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };


}
