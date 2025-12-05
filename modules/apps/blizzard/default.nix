{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wowup-cf
   # geckodriver

      (wineWowPackages.full.override {
        wineRelease = "staging";
        mingwSupport = true;
       })

      (lutris.override {
        extraPkgs = pkgs: [
          # List package dependencies here
          wineWowPackages.stable
          winetricks
         ];
      })
    ];
}
