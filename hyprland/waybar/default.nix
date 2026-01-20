{ pkgs, hyprlandConfig, ... }:
{
  imports = [ ./${hyprlandConfig} ];
  environment.systemPackages = with pkgs; [ waybar ];
}
