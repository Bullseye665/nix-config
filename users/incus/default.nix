{ config, lib, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  my.services.incus.enable = true;
}
