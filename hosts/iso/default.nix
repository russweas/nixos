{
  lib,
  nixpkgs,
  pkgs,
  ...
}:
{
  imports = [
    "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  # Auto-login as nixos user
  services.getty.autologinUser = lib.mkForce "nixos";

  # Useful tools for installing this flake
  environment.systemPackages = with pkgs; [
    git
    vim
    parted
    gptfdisk
    cryptsetup
  ];

  # Enable SSH for remote installation if needed
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
}
