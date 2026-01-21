{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wowup-cf

      (wineWowPackages.full.override {
        wineRelease = "staging";
        mingwSupport = true;
      })
      winetricks
    ];
}
