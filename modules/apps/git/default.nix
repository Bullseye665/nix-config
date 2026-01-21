{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python3Full
    python312Packages.types-lxml
    wget
  ];

  programs.git = {
    enable = true;
#    userName = "Bullseye665";
#    userEmail = "caleb.comstock6@gmail.com";
#  };
}
