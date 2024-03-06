{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    transmission_4
    transmission-gtk
  ];

  networking = {
    networkmanager = {
      firewall = {
        allowedTCPPorts = [ 57766 ];
      };
    };
  };
}
