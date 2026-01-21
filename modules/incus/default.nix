{ config, pkgs, usernaame, ... }: {
  virtualisation.incus = {
    enable = true;
    ui.enable = true;
    agent.enable = true;
  };
  networking = {
    nftables.enable = true;
    firewall.interfaces.incusbr0 = {
      allowedTCPPorts = [
        53
        67
      ];
      allowedUDPPorts = [
        53
        67
        ];
    };
  };
  users.users.${username}.extraGroups = ["incus-admin"];
}
