{ username, ... }: {
  imports = [
  ./${username}
  ];

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;

  # jellyfin

  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "caleb.comstock6@gmail.com";
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
