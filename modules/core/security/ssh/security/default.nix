{ username, hostName, ... }: {
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8+r8XOJk8mpMIJHbdvQ7VOoWw66MhV4dA0GAMpj5PR ${username}"
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
