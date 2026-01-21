{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    duckstation         # PS1
    pcsx2               # PS2
    rpcs3               # PS3
    shadps4             # PS4

    ppsspp              # PSP
  ];
}
