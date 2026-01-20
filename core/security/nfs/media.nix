{ pkgs, ... }: {
  boot.supportedFilesystems = [ "nfs" ];
  environment.systemPackages = with pkgs; [ nfs-utils ];

  fileSystems."/media" = {
    device = "192.168.0.160:/mnt/alpha/vault/media";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
}
