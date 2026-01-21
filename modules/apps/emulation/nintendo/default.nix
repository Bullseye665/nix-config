{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    snes9x              # SNES and SFN
    simple64            # N64
    parallel-launcher   # N64
    mupen64plus         # N64
    dolphin-emu         # Wii and GC
    cemu                # Wii U
    ryubing             # Switch 1

    skyemu              # GB, GBC, GBA, and DS
    mgba                # GBA
    desmume             # DS
    melonDS             # DS
    azahar              # 3DS

#    perfect_dark        # N64 Port
  ];
}
