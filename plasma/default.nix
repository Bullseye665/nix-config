{ pkgs, username, home-manager, inputs, ... }:  # plasma-manager,
{
  imports = [
   # ./brightness
    ./config
#    ./kate
#    ./partition-manager
   # ./kcm-grub2
  ];

  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.greeters.gtk.enable = false;
    };
  };

  services = {
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = false;
      defaultSession = "plasmax11";
    };
    desktopManager = {
      plasma6.enable = true;
    };
  };
 #libsForQt5
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    oxygen
    khelpcenter
    okular
  ]; #exclude

#  hardware.ckb-next = {
#    enable = true;
#    package = pkgs.ckb-next.overrideAttrs (old: {
#      cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DUSE_DBUS_MENU=0" ];
#    });
#  };
}
