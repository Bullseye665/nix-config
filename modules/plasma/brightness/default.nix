{ pkgs, username, ... }: {
  users.users.${username} = {
   packages = with pkgs; [ ddcutil ];
   extraGroups = [ "i2c" ];
  };
}
