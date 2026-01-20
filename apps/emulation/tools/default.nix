{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
#    n64recomp           # Tool to statically recompile N64 games into native executables
#    punes               # NES and NSF/NSFe Music Player
#    game-music-emu      # Collection of video game music file emulators
#    maxcso              # ISO to CSO compression PSP and PS2
    ctrtool             # 3DS data extractor
#    cdecrypt            # Wii U NUS decryption
#    wiiuse              # Wii Remote access library
  ];
}
