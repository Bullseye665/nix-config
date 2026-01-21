{ pkgs, ... }: {
  imports = [
  ./core/boot/systemd.nix
  ./core/nix
  ./core/pkgs/container.nix
  ./core/security/ddns_updater
  ./core/security/headscale
  ./core/security/nginx
  ./core/security/vaultwarden
  ./garbage
  ];
}
