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
  services.blueman.enable = false;

  systemd.user.services.mpris-proxy = {
     description = "Mpris proxy";
     after = [ "network.target" "sound.target" ];
     wantedBy = [ "default.target" ];
     serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}
