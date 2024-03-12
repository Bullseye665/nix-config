{ plasma-manager, username, ... }: {
  home-manager.users.${username} = {
    imports = [ plasma-manager.homeManagerModules.plasma-manager ];

  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "select";
      tooltipDelay = 5;
      theme = "Monochrome";
      colorScheme = "Monochrome";
      cursorTheme = "Adwaita";
      iconTheme = "Breeze Dark";
      wallpaper = "/home/person/nixflakes/assets/backgrounds/";
    };

    kwin.titlebarButtons = {
     left = [ "on-all-desktops" "keep-above-windows" ];
     right = [ "help" "minimize" "maximize" "close" ];
   };

    spectacle.shortcuts = {
      captureActiveWindow = "Meta+Print";
      captureCurrentMonitor = "Print";
      captureEntireDesktop = "Shift+Print";
      captureRectangularRegion = "Meta+Shift+S";
    };
   };
 };
}

