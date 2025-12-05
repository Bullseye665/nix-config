{ pkgs, username, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "12345";
    extraGroups = [
      "sshd"
      "networkmanager"
      "wheel"
      "root"
    ];
  };
}
