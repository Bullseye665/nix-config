{ pkgs, ... }:  # plasma-manager,
{
  imports = [
    ./config
#    ./kate
#    ./partition-manager
   # ./kcm-grub2
  ];

  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
#      defaultSession = "plasmawayland";
      lightdm.greeters.gtk.enable = false;
    };
    desktopManager = {
      plasma5.enable = false;
      plasma6.enable = true;
    };
  };
                  # 5
  environment.plasma6.excludePackages = with pkgs.libsForQt5; [
    elisa
    oxygen
    khelpcenter
    okular
  ]; #exclude
}
