{ username, hostName, ... }: {
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ/jmYGw8gSvk/8/MitmJLAlZhES4JhvCYWmhf8OuPav ${username}"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBUGvDDxjpSuBb5BaS62E08A+hqMdRtUxfKlC5S4lPX1 ${hostName}"
    ];
  };

  services.openssh = {
    enable = true;
    ports = [ 4545 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
