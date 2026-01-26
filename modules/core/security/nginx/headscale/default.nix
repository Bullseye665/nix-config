{
  services.nginx = {
    virtualHosts."scale.personmedia.cc" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass =
          "http://192.168.0.161:8080";
        proxyWebsockets = true;
      };
    };
  };
}
