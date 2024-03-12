{ home-manager, ... }: {
  imports = [
    home-manager.nixosModules.home-manager
    ./users
    ./hosts
    ./modules/core/boot/systemd.nix
    ./modules/core/nix
    ./modules/core/pkgs/minimum.nix
    ./modules/core/terminal
  ];
}
