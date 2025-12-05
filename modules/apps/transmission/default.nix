{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ transmission_4-qt ];

#  networking = {
#    networkmanager = {
#      firewall = {
#        allowedTCPPorts = [ 57766 ];
#     };
#    };
#  };
}
