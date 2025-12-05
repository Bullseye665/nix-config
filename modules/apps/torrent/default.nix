{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mktorrent
    torrent7z
#    ytdownloader
#    onthespot
  ];

}
