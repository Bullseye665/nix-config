{ hyprland, hyprpicker, pkgs, username, home-manager, system, ... }: {
  imports = [
    hyprland.nixosModules.default
    ./config
   # ./greetd
   # ./hyprlock
    ./mako
#    ./niri
    ./swaylock
    ./waybar
    ./wofi
  ];

  home-manager.users.${username} = _: {
    gtk = {
      enable = true;
      cursorTheme.name = "Adwaita";
      cursorTheme.package = pkgs.gnome.adwaita-icon-theme;
      theme.name = "adw-gtk3-dark";
      theme.package = pkgs.adw-gtk3;
    };
  };

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      grim
      swww
      hyprpicker.packages.${system}.default
      lxqt.lxqt-policykit
      slurp
      wl-clipboard
      # Required if applications are having trouble opening links
      xdg-utils
      xfce.thunar
      xfce.tumbler

      # dont know if needed
     # flameshot
     # libnotify
     # rxvt
     # rofi-wayland
     # swww
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    dconf.enable = true;
  };

  services.gnome = { gnome-keyring.enable = true; };

  security = { pam = { services = { login.enableGnomeKeyring = true; }; }; };

  services.gvfs.enable = true;

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "xdph" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}

