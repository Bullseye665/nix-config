{ nix-flatpak, ... }: {
  imports = [ nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    packages = [
     "org.qbittorrent.qBittorrent"  # Torrent
     "com.ktechpit.torrhunt"        # Torrent Search

#      "com.dosbox_x.DOSBox-X"       # DOS Box
#      "org.duckstation.DuckStation" # PS1
#      "net.pcsx2.PCSX2"             # PS2
#      "net.rpcs3.RPCS3"             # PS3
#      "app.xemu.xemu"               # Xbox
#      "io.mgba.mGBA"                # GBA
#      "org.desmume.DeSmuME"         # DS
#      "net.kuribo64.melonDS"        # DS
#      "io.github.simple64.simple64" # N64
#      "org.DolphinEmu.dolphin-emu"  # Wii and GC
#      "info.cemu.Cemu"              # Wii U
      "org.ryujinx.Ryujinx"         # Switch 1
 #     "org.libretro.RetroArch"      #

     # "com.heroicgameslauncher.hgl" # Epic, GOG, and AP Launcher
     # "com.valvesoftware.Steam"


#      "com.github.Xenoveritas.abuse"             # Abuse 1995
#      "io.gitlab.stone_kingdoms.StoneKingdoms"   # Stronghold
#      "io.github.theforceengine.tfe"             # STAR WARS: Dark Forces
#      "org.tuxemon.Tuxemon"                      # Dif Pokemon
#      "com.endlessnetwork.dragonsapprentice"     # Dragon’s Apprentice
#      "net.sourceforge.uhexen2.uhexen2"          # Hexen II
     # "com.endlessnetwork.passage"               # The Passage
#      "org.diasurgical.DevilutionX"              # Diablo
      "com.exok.Celeste64"                        # Celeste 64
     # "io.mrarm.mcpelauncher"                     # Bedrock launcher

      "io.github.aandrew_me.ytdn"   # ytDownloader
#      "io.github.tcobbs.LDView"    # lego 3D viewer

    ];

    update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };

#    overrides = {
#      global = {
#        # Force correct theme for some GTK apps
#        GTK_THEME = "Adwaita:dark";
#       };
#    };
  };
}
