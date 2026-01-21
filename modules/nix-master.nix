{ pkgs, ... }: {
  imports = [
  ./apps/gitea
  ./core/nix
  ./core/security/agenix
  ./core/security/ssh
  ./core/security/tailscale
  ./garbage
  ];
}
