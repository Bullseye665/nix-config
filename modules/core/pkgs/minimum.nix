{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
    alacritty     # Terminal
    btop          # resource monitor
    lf
#    nitch         # System fetch
    pavucontrol   # PulseAudio Volume Control
#    playerctl     # Command-line media player controller
#    musikcube     # Terminal spotify-like
    ranger        # terminal flie manager
    ripgrep       # The Silver Searcher + grep ...?
    tty-clock     # clock
  ];
}
