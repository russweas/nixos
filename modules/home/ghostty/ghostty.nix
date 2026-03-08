{ host, ... }:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      ##### Shell #####
      shell-integration = "fish";
      command = "fish";

      ##### Font #####
      font-family = [
        "Maple Mono"
        # "DejaVu Sans"
      ];
      font-size = "${if (host == "laptop") then "16" else "18"}";
      font-feature = [
        "calt"
        "cv66"
        "ss05"
      ];

      ##### Theme #####
      theme = "catppuccin-mocha";
      background-opacity = 0.5;
      adjust-cursor-thickness = 1;

      selection-clear-on-copy = true;
      mouse-hide-while-typing = true;

      ##### Window #####;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-decoration = "none";
      window-theme = "ghostty";
      window-inherit-working-directory = false;

      resize-overlay = "never";
      confirm-close-surface = false;
      app-notifications = "no-clipboard-copy";

      bell-features = "no-attention,no-audio,no-system,no-title,no-border";

      gtk-single-instance = true;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;
      gtk-custom-css = "styles/tabs.css";

      auto-update = "off";

      clipboard-read = "allow";
      clipboard-write = "allow";
      clipboard-paste-protection = false;

      ##### Keybinds #####
      keybind = [
        "clear"

        "ctrl+shift+a=select_all"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        "ctrl+shift+t=new_tab"
        "ctrl+shift+w=close_tab:this"
        "alt+digit_1=goto_tab:1"
        "alt+digit_2=goto_tab:2"
        "alt+digit_3=goto_tab:3"
        "alt+digit_4=goto_tab:4"

        "ctrl+equal=increase_font_size:1"
        "ctrl++=increase_font_size:1"
        "ctrl+-=decrease_font_size:1"
        "ctrl+0=reset_font_size"

        "shift+page_down=scroll_page_down"
        "shift+page_up=scroll_page_up"

        "ctrl+shift+r=reload_config"
      ];
    };

    themes.catppuccin-mocha = {
      background = "1e1e2e";
      foreground = "cdd6f4";

      cursor-color = "f5a97f";

      selection-background = "cell-foreground";
      selection-foreground = "cell-background";

      palette = [
        "0=1e1e2e"
        "1=f38ba8"
        "2=a6e3a1"
        "3=f9e2af"
        "4=89b4fa"
        "5=cba6f7"
        "6=94e2d5"
        "7=cdd6f4"

        "8=45475a"
        "9=f38ba8"
        "10=a6e3a1"
        "11=f9e2af"
        "12=89b4fa"
        "13=cba6f7"
        "14=94e2d5"
        "15=f5c2e7"
      ];
    };
  };

  xdg.configFile."ghostty/styles/tabs.css".source = ./styles/tabs.css;
}
