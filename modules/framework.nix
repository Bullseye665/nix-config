{ nixos-hardware, pkgs, xlibre-overlay, ... }: {
  imports = [
  nixos-hardware.nixosModules.framework-11th-gen-intel
  xlibre-overlay.nixosModules.overlay-xlibre-xserver
  xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
#  ./apps
#  ./core
#  ./core/boot/grub.nix
  ./core/boot/systemd.nix
  ./core/pkgs/minimum.nix
  ./core/terminal
#  ./eriixpkgs
  ./garbage
#  ./gnome
#  ./hardware
#  ./hardware/graphics/amd
#  ./hardware/graphics/nvidia
#  ./hyprland
#  ./plasma
#  ./virt
  ./xfce
  ];
}
