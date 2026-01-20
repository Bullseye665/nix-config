{ pkgs, ... }: {
  imports = [
  ./apps/jellyfin
  ./apps/torrent
  ./core/boot/systemd.nix
  ./core/nix
  ./core/pkgs/container.nix
  ./core/security/agenix
  ./core/security/ssh
  ./core/security/tailscale
  ./core/security/nfs/media.nix
  ./garbage
  ./hardware/graphics/intel
  ];
}
