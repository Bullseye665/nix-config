{ hostName, username, ... }: {
  networking = {
    networkmanager = {
      enable = true;
     # wifi.powersave = true;  #https://www.reddit.com/r/GalaxyS8/comments/7z5khi/what_does_wifi_power_saving_mode_do_exactly/
     # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    };
    inherit hostName;
  };
  users.users.${username} = { extraGroups = [ "networkmanager" ]; };
}
