{ config, lib, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  # Enables flatpak use
  services.flatpak.enable = true;
}
