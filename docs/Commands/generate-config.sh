#!/run/current-system/sw/bin/bash
sudo nixos-generate-config
mv /etc/nixos/hardware-configuration.nix /home/person/nixflakes/users/person/hardware-configuration.nix
