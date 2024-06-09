{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ spotify ];

  home-manager.users.${username} = {
    services.spotifyd = {
      enable = true;
      settings = {
          global = {
            username = "";
            password = "";
          };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
}
