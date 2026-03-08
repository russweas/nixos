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
    # LUKS encrypted root — update UUID to match your LUKS partition
    # (run `blkid /dev/<your-luks-partition>` to find it)
    initrd.luks.devices."cryptroot" = {
      device = "/dev/disk/by-uuid/761317bf-c727-4d12-b663-bc8eaa0227cc";
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
