{ pkgs, ... }: {
  boot.supportedFilesystems = [ "nfs" ];
  environment.systemPackages = with pkgs; [ nfs-utils ];

  fileSystems."/vault" = {
    device = "192.168.0.160:/mnt/alpha/vault";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
}
