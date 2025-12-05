{ home-manager, username, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ./hosts
    ./modules/${username}.nix
    ./users
  ];
}
