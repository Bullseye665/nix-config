{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
    lf
    nano
    toybox
  ];
}
