#!/run/current-system/sw/bin/bash

sudo nix flake update --flake /home/person/nixflakes

sudo nixos-rebuild switch --flake /home/person/nixflakes#person
