{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    grub2
  ];

  # Bootloader.
  boot = {
    kernelParams = ["nohibernate"];
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    loader = {
      efi.canTouchEfiVariables = false; #
      systemd-boot.enable = false;
      efi.efiSysMountPoint = "/boot";
      grub = {
        efiInstallAsRemovable = true;   #
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";

         extraEntriesBeforeNixOS = true;
      extraEntries = ''
        menuentry "Poweroff" {
          halt
        }
        menuentry "Reboot" {
          reboot
        }
      '';
       };
      timeout = 300;
    };
  };
}
