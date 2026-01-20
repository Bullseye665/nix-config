{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    atari800            # Atari 800
    stella              # Atari 2600
    hatari              # Atari ST/STE/TT/Falcon
  ];
}
