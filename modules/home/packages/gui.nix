{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    audacity
    gimp
    jellyfin-media-player
    media-downloader
    obs-studio
    pavucontrol
    soundwireserver
    video-trimmer
    vlc

    ## VPN & Network
    mullvad-vpn
    mullvad-browser
    qbittorrent

    ## Office
    libreoffice
    gnome-calculator

    ## Security
    _1password-gui

    ## Utility
    dconf-editor
    gnome-disk-utility
    popsicle
    mission-center # GUI resources monitor
    zenity

    ## Level editor
    ldtk
    tiled
  ];
}
