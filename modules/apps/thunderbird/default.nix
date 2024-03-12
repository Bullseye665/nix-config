{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ thunderbird ];

 # home-manager.users.${username} = {
 # https://mynixos.com/search?q=thunderbird

}
