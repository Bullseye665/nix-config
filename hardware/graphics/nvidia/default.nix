{ config, lib, pkgs, username, ... }: {

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    open = false;
    nvidiaSettings = true;      # nvidia-settings app
    package = config.boot.kernelPackages.nvidiaPackages.beta;
                                                      # stable
                                                      # beta
                                                      # production
                                                      # vulkan_beta
                                                      # legacy_470
                                                      # legacy_390
                                                      # legacy_340
  };

    # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users.${username} = { extraGroups = [ "video" "render" ]; };
}
