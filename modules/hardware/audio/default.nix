{ pkgs, username, ... }: {
  users.users.${username} = { extraGroups = [ "audio" ]; };
  # Sound settings
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pulseaudio.support32Bit = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
