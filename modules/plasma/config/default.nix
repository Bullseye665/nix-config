{ plasma-manager, home-manager, username, ... }: {
  home-manager.users.${username} = {
    imports = [ plasma-manager.homeModules.plasma-manager ];

  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "select";
      tooltipDelay = 5;
      theme = "Monochrome";
      colorScheme = "Monochrome";
      cursor.theme = "Adwaita";
      iconTheme = "Breeze Dark";
     # wallpaper = "/home/person/nixflakes/assets/backgrounds/";
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

