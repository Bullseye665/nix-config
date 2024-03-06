{ pkgs, username, ... }:
{
  users.users.${username} = {
    packages = with pkgs; [ partition-manager ];
  };
}
