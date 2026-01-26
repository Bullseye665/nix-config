{
  services.nginx = {
    virtualHosts."incus.personmedia.cc" = {
       enableACME = true;
       forceSSL = true;
       locations."/" = {
         proxyPass = "https://127.0.0.1:8443";
        };
    };
  };
}
