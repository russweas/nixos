{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        # Main monitor (Dell ultrawide)
        "HDMI-A-1, 3440x1440@120, 0x0, 1"
        # TV — any additional monitor, to the right
        ", preferred, auto-right, 1"
      ];
    };

    extraConfig = ''
      # hyprlang noerror true
        source = ~/.config/hypr/monitors.conf
        source = ~/.config/hypr/workspaces.conf
      # hyprlang noerror false
    '';
  };

  home.packages = with pkgs; [ nwg-displays ];
}
