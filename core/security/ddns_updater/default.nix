{ config, pkgs, ... }: {
  services.cloudflare-ddns = {
    enable = true;
    proxied = true;
    updateCron = @every 72h;
    domains = *.personmedia.cc;
    credentialsFile = ;
}
