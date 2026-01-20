{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
#    supermodel          # Sega Model 3 Arcade

    yabause             # Sega Saturn
    nuked-md            # Mega Drive / Genesis
    dgen-sdl            # Mega Drive / Genesis
    blastem             # Mega Drive / Genesis
  ];
}
