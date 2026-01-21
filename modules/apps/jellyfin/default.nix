{ pkgs, lib, config, ... }: {
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  services.jellyfin = {
  enable = true;
  openFirewall = true;
  logDir = "/media/jellyfin/log";
  cacheDir = "/media/jellyfin/cache";
  dataDir = "/media/jellyfin/metadata";
  configDir = "/media/jellyfin/config";
  };

  # Hardware Transcoding
  # enables vaapi on OS-level
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
}
