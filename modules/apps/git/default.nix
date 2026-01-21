{ config, pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    python3Full
    python312Packages.types-lxml
    wget
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
#      userName = "Bullseye665";
#      userEmail = "caleb.comstock6@gmail.com";
    };
}
