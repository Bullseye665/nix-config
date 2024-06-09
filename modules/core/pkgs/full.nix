{ pkgs, ... }:
{
   environment.systemPackages = with pkgs; [
    discord
    flatpak
    gnomeExtensions.settingscenter  # Nvidia Settings center
#    gnome.gnome-software  # Flatpak installer
    grub2
    joplin-desktop
    linuxKernel.packages.linux_xanmod_stable.nvidia_x11  #?
    neofetch
    protonup-qt
    protontricks
    vlc
    zsh

    # minimum
   # alacritty     # Terminal
   # btop          # resource monitor
   # pavucontrol   # PulseAudio Volume Control
   # ranger        # terminal flie manager
   # ripgrep       # The Silver Searcher + grep ...?
    ];
}


