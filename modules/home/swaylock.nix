{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;

    package = pkgs.swaylock-effects;

    settings = {
      clock = true;
      daemonize = true;
      # timestr="%H:%M";
      datestr = "";
      screenshots = true;
      ignore-empty-password = true;

      indicator = true;
      indicator-radius = 111;
      indicator-thickness = 9;

      effect-blur = "7x5";
      effect-vignette = "0.75:0.75";
      effect-pixelate = 5;

      font = "Maple Mono";

      text-wrong-color = "CDD6F4FF";
      text-ver-color = "CDD6F4FF";
      text-clear-color = "CDD6F4FF";
      text-color = "CDD6F4FF";
      key-hl-color = "F9E2AFFF";
      bs-hl-color = "F38BA8FF";
      ring-clear-color = "A6E3A1FF";
      ring-wrong-color = "F38BA8FF";
      ring-ver-color = "A6E3A1FF";
      ring-color = "89B4FAFF";
      line-clear-color = "FFFFFF00";
      line-ver-color = "FFFFFF00";
      line-wrong-color = "FFFFFF00";
      separator-color = "FFFFFF00";
      line-color = "FFFFFF00";
      inside-color = "1E1E2EDD";
      inside-ver-color = "1E1E2EDD";
      inside-clear-color = "1E1E2EDD";
      inside-wrong-color = "1E1E2EDD";
      layout-bg-color = "FFFFFF00";
      layout-text-color = "CDD6F4FF";
    };
  };
}
