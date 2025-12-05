#!/run/current-system/sw/bin/bash
sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system

nix-env --delete-generations old

sudo nix-collect-garbage -d

nix-collect-garbage -d

sudo nix-store --optimise

nix-store --optimise
