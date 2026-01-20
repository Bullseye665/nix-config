{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
    alacritty     # Terminal
    lf            # file finder
    nano
    pavucontrol   # PulseAudio Volume Control
    ripgrep       # The Silver Searcher + grep ...?
    toybox
    tty-clock     # clock
  ];
}
