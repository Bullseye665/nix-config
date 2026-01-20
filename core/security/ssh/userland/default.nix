{ username, hostName, ... }: {
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6q5hwAoyCQE1nRCtKDHIztdtF4jf+leCgZIrb2fEoJ ${username}"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFAIWFUr0N4RNpR7L1zjVZEVBQ3iWjC5PGEWUSNCSiJR ${hostName}"
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
