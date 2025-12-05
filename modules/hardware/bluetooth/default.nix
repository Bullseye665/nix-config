 {pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Enable = "Source, Sink, Media, Socket";
      };
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.wireplumber.extraConfig."10-bluez" = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [
        "hsp_hs"
        "hsp_ag"
        "hfp_hf"
        "hfp_ag"
      ];
    };
  };

  systemd.user.services.mpris-proxy = {
     description = "Mpris proxy";
     after = [ "network.target" "sound.target" ];
     wantedBy = [ "default.target" ];
     serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}
