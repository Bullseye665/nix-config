{ pkgs, ... }: { environment.systemPackages = with pkgs; [ apcupsd ]; }
