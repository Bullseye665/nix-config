{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs; [
      gamescope
      heroic
      zulu8
      lutris-unwrapped
      mangohud
      protonup-qt
      r2modman
      steam
      steam-run
      wine64
      winetricks
     # nexusmods-app # https://github.com/NixOS/nixpkgs/pull/270372
#      steamtinkerlaunch
#      bottles
#      winePackages.fonts
    ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
