{ ... }:
{
  imports = [ ./default.nix ];

  wayland.windowManager.hyprland.settings.monitor = [
    # Main monitor (Dell ultrawide)
    "HDMI-A-1, 3440x1440@120, 0x0, 1"
    # TV — any additional monitor, to the right
    ", preferred, auto-right, 1"
  ];
}
