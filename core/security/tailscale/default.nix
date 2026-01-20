{ username, ... }: {
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--login-server https://scale.personmedia.cc" "--operator=${username}" ];
  };
  networking.firewall = {
    checkReversePath = "loose";
    trustedInterfaces = [ "tailscale0" ];
#    allowedUDPPorts = [ config.services.tailscale.port ];
  };
}
