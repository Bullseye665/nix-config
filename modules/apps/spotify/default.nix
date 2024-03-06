{ pkgs, username, ... }:
{
  users.users.${username} = {
    packages = with pkgs; [ spotify ];
  };

  services.spotifyd = {
  enable = true;
  settings =
    {
      global = {
        username = "caleb.comstock6@gmail.com";
        password = "Chevelle76";
      };
     };
  };

  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
}
