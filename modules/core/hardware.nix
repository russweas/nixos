{ pkgs, ... }:
{
  boot = {
    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
    kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        nvidia-vaapi-driver
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
