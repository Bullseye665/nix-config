{ pkgs, ... }: {
  boot.supportedFilesystems = [ "nfs" ];
  environment.systemPackages = with pkgs; [ nfs-utils ];

  fileSystems."/vault" = {
    device = "192.168.0.160:/mnt/alpha/vault";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

#  services.nfs.server.enable = true;
#  services.nfs.server.exports = ''
#    /export         192.168.0.0(rw,fsid=0,no_subtree_check)
#    /export/Extra  192.168.0.0(rw,nohide,insecure,no_subtree_check)
#  '';
}
