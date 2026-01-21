{ pkgs, ... }: {
  boot.supportedFilesystems = [ "nfs" ];
  environment.systemPackages = with pkgs; [ nfs-utils ];

  services.nfs.server.enable = true;
  services.nfs.server.exports = '' /nix/store  192.168.0.1(rw,fsid=0,no_subtree_check) '';
}
