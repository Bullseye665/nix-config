{
  # Set your time zone.
  time.timeZone = "America/Detroit";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # For Windows dualboot
  time.hardwareClockInLocalTime = true;

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
}
