{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  services.printing.enable = true;

  boot = {
    initrd.luks.devices."cryptroot" = {
      device = "/dev/disk/by-uuid/be3ff686-2308-48d4-acf1-983fc074edbe";
      allowDiscards = true;
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # "splash" activates Plymouth; "quiet" is already set in bootloader.nix
    kernelParams = [ "splash" ];
  };
}
