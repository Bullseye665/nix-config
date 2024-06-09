{
  imports = [ ./hardware-configuration.nix ];

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "laptop";

  services.fwupd.enable = true;

  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = false; # https://github.com/AdnanHodzic/auto-cpufreq?tab=readme-ov-file#nixos
  services.tlp = {
    settings = {

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

     CPU_BOOST_ON_BAT = 0;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      START_CHARGE_THRESH_BAT0 = 30;
      STOP_CHARGE_THRESH_BAT0 = 95;
      RUNTIME_PM_ON_BAT = "auto";
    };
  };
}
