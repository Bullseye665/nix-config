{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ spotify ];

#  home-manager.users.${username} = {
#    services.spotifyd = {
#      enable = true;
#      settings = {
#          global = {
#            username = "caleb.comstock6@gmail.com";
#            password = "Chevelle76";
#          };
#     };
#    };
#  };

  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
}
