{ config, pkgs, ... }: {
  imports = [
    ./config
    ./qt
  ];

  services = {
    displayManager = {
      defaultSession = "lxqt+i3";
    };
    xscreensaver.enable = true;
    xserver = {
      enable = true;
      desktopManager = {
        lxqt = {
          enable = true;
        };
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
#          i3status
#          i3lock
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kate
    lxqt.qlipper
  ];

  environment.lxqt.excludePackages = with pkgs.lxqt; [
    lxqt-about
    lxqt-powermanagement
    lxqt-runner
    lxqt-sudo
    lxqt-wayland-session
    qterminal
    qps

  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs.lxqt; [
     xdg-desktop-portal-lxqt
    ];
  };
}
