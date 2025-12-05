{ config, pkgs, lib, home-manager, username, ... }:
  let
    # Change this to your username.
    user = "${username}";
    # Change this to match your system's CPU.
    platform = "amd";
    # Change this to specify the IOMMU ids you wrote down earlier.
    vfioIds = [ "10de:2482" "10de:228b" ];
              # "10de:2482" "10de:228b"
  in {
    boot = {
      initrd.kernelModules = [
        "kvm-${platform}"
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
       # "vfio_virqfd" # 6.21 kernal builtin?

       # "nvidia"
       # "nvidia_modeset"
       # "nvidia_uvm"
       # "nvidia_drm"
      ];

      kernelParams = [
        "${platform}_iommu=on"
        "${platform}_iommu=pt"
        "kvm.ignore_msrs=1"
      ];

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
        runAsRoot = true;
      };
     # onBoot = "ignore";
     # onShutdown = "shutdown";
    };
    spiceUSBRedirection.enable = true;
  };
  hardware.opengl.enable = true;
  services.spice-vdagentd.enable = true;

  users.users.${username}.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    virt-viewer
    virtio-win
    win-spice
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
 # systemd.network.wait-online.enable = false;
 # boot.initrd.systemd.network.wait-online.enable = false;
}
