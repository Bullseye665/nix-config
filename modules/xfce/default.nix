 { config, pkgs, callPackage, ... }: {
  imports = [ ./config ];

  services = {
    displayManager.defaultSession = "xfce+i3";
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
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
     # updateSessionEnvironment = true; # do I kneed?
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kate
    libsForQt5.qtstyleplugin-kvantum
  ];

  environment.xfce.excludePackages = with pkgs.xfce; [
    mousepad
    parole
    ristretto
    thunar
    xfce4-appfinder
    xfce4-taskmanager
    xfce4-terminal
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
     xdg-desktop-portal-xapp
    ];
  };
}
