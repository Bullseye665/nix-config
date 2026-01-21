{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
#    torrent7z
#    onthespot
    qbittorrent
  ];

}
