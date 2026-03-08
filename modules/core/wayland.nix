{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  environment.sessionVariables = {
    MOZ_DISABLE_RDD_SANDBOX = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
