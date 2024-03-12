{ config, pkgs, home-manager, username, ... }:
  let
    # Change this to your username.
    user = "${username}";
    # Change this to match your system's CPU.
    platform = "amd";
    # Change this to specify the IOMMU ids you wrote down earlier.
    vfioIds = [ "10de:2482" ];
  in {
    # Configure kernel options to make sure IOMMU & KVM support is on.
    boot = {
      kernelModules = [ "kvm-${platform}" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
      kernelParams = [ "${platform}_iommu=on" "${platform}_iommu=pt" "kvm.ignore_msrs=1" ];
      extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
  };

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

  users.users.${username}.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    virt-viewer
    virtio-win
    win-spice
    looking-glass-client
    virtiofsd
  ];

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  programs.virt-manager.enable = true;

  home-manager.users.${username} = {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
