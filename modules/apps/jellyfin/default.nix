{ pkgs, home-manager, username, ... }: { environment.systemPackages = with pkgs; [ jellyfin ]; }
