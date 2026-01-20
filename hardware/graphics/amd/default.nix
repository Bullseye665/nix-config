{ config, lib, pkgs, username, ... }: {

  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelPackages = pkgs.linuxPackages_testing;  # tmp for 9070 support

  services.xserver = {
    enable = true;
    videoDrivers = ["modesetting"];
  };

  hardware = {
    amdgpu = {
      overdrive = {
        enable = true;
        ppfeaturemask = "0xfffd3fff"; # 0xffffffff
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
       # amdvlk
      ];
      extraPackages32 = with pkgs; [
       # driversi686Linux.amdvlk
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    clinfo
    corectrl
    furmark
    hwdata
   # lact
  ];

  systemd.packages = with pkgs; [
   # lact
  ];

#  systemd.services.lact = {
#    description = "LACT Daemon";
#    after = [ "multi-user.target" ];
#    wantedBy = [ "multi-user.target" ];
#    serviceConfig = {
#      ExecStart = "${pkgs.lact}/bin/lact daemon";
#    };
#    enable = true;
#  };

#     hardware.firmware = with pkgs; [
#     (linux-firmware.overrideAttrs (old: {
#       src = builtins.fetchGit {
#         url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
#          rev = "de78f0aaafb96b3a47c92e9a47485a9509c51093"; # Uncomment this line to allow for pure builds
#       };
#     }))
#   ];

  users.users.${username} = { extraGroups = [ "video" "render" ]; };

}
