{ ... }: { # https://search.nixos.org/options?channel=25.11&query=headscale
  services.headscale = {
    enable = true;
    address = "0.0.0.0";
    port = 8080;
    server_url = "https://scale.personmedia.cc";
    dns = {
      baseDomain = "ezsh.net";
    };
    settings = {
      logtail.enabled = false;
    };
  };
}
