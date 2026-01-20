{ pkgs, ... }: {
  imports = [
#    ./atari
    ./nintendo
    ./playstation
#    ./sega
    ./tools
    ./xbox
  ];

  environment.systemPackages = with pkgs; [
    dosbox-x            # DOS Box
#    deniseemu           # C64 and Amiga
#    fsuae               # A500, A500+, A600, A1200, A1000, A3000 and A4000
#    openmsx             # MSX

#    ruffle              # Adobe Flash Player

    retroarch-full      #
#    librashader         # crt shader for retroarch
  ];
}
