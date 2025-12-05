{ config, pkgs, ... }: { environment.systemPackages = with pkgs; [ webull-desktop ]; }
