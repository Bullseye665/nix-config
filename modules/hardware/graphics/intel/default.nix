{ config, lib, pkgs, username, ... }: {
services.xserver.videoDrivers = [ "modesetting" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Required for modern Intel GPUs (Xe iGPU and ARC)
      intel-media-driver     # VA-API (iHD) userspace
      vpl-gpu-rt             # oneVPL (QSV) runtime // 11th gen or newer
      # or intel-media-sdk for QSV // up to 11th gen

      intel-vaapi-driver # previously vaapiIntel
      vaapiVdpau # both wrote in jellyfin setup

      # Optional (compute / tooling):
      intel-compute-runtime  # OpenCL (NEO) + Level Zero for Arc/Xe
      # NOTE: 'intel-ocl' also exists as a legacy package; not recommended for Arc/Xe.
      libvdpau-va-gl # Only if you must run VDPAU-only apps
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";     # Prefer the modern iHD backend
    VDPAU_DRIVER = "va_gl";      # Only if using libvdpau-va-gl
  };

#  users.users.<service>.extraGroups = [ "video" "render" ];
}
