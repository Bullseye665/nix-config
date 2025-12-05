{ ... }: {
  imports = [
    ./core/boot/systemd.nix
    ./core/nix
    ./core/pkgs/minimum.nix
    ./core/terminal
  ];
}
