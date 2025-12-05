{ pkgs, ... }: {
  imports = [
  ./apps/gitea
  ./core/nix
  ./core/pkgs/container.nix
  ./core/security
  ./garbage
  ];
}
