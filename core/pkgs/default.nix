{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
    fastfetch
    vlc
    zsh
    ];
}


