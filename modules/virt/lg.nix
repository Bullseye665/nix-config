{ config, pkgs, home-manager, username, ... }: {                       # qemu-libvirtd
  systemd.tmpfiles.rules = [ "f /dev/shm/looking-glass 0660 ${username} kvm -" ];

  environment.systemPackages = with pkgs; [ looking-glass-client ];

  home-manager.users.${username} = {
    programs.looking-glass-client.settings = {
        app = {
          allowDMA = true;
         # shmFile = "/dev/kvmfr0";
        };

        win = {
          fullScreen = true;
         # showFPS = false;
         # jitRender = true;
        };

        spice = {
          enable = true;
          audio = true;
        };

        input = {
          rawMouse = true;
          escapeKey = 62;
        };
    };
  };
}
