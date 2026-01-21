{ pkgs, xlibre-overlay, ... }: {
  imports = [
  xlibre-overlay.nixosModules.overlay-xlibre-xserver
  xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
  ./apps
  ./core
  ./core/boot/grub.nix
#  ./core/boot/systemd.nix
#  ./eriixpkgs
  ./garbage
#  ./gnome
  ./hardware
  ./hardware/graphics/amd
#  ./hardware/graphics/nvidia
  ./hardware/printer
#  ./hardware/user-interface
#  ./hyprland
  ./lxqt
#  ./plasma
#  ./virt
 # ./xfce
  ];
}
