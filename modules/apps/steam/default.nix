{ pkgs, username, ... }: {
  # Required to run Windows applications ie World of Warcraft
  users.users.${username} = {
    packages = with pkgs; [
      steam
      steam-run
      lutris
      wine64
#      winePackages.fonts

      (wineWowPackages.full.override {
        wineRelease = "staging";
        mingwSupport = true;
       })
      winetricks

      (lutris.override {
        extraPkgs = pkgs: [
          # List package dependencies here
          wineWowPackages.stable
          winetricks
         ];
      })
    ];
  };

  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (builtins.parseDrvName pkg.name).name ["steam"];
}
