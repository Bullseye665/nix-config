{ ... }: {
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;

    # headscale
    virtualHosts."scale.personmedia.cc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass =
          "http://192.168.0.161:8080";
        proxyWebsockets = true;
      };
    };

    # vaultwarden
    virtualHosts."vault.personmedia.cc" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
