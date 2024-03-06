{ pkgs, ... }:  # plasma-manager,
{
  imports = [
#    plasma-manager.homeManagerModules.plasma-manager
#    ./config
    ./kate
    ./partition-manager
   # ./kcm-grub2
  ];

  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
#      defaultSession = "plasmawayland";
    };
    desktopManager.plasma5.enable = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    oxygen
    khelpcenter
    okular
  ]; #exclude
}
