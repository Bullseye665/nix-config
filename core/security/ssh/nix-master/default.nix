{ username, hostName, ... }: {
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUDWATOlPmMP6gh9C8rA5I/o/yP4HrtqjidvaoM9ML4 ${username}"
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
