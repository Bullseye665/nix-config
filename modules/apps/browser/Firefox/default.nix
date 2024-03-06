{ pkgs, home-manager, username, ... }:
{

  #----- System Configuration -----
  #programs = {
  #  chromium = {
  #    enable = true;
  #    extraOpts = {
  #      "BrowserSignin" = 1;
  #      "SyncDisabled" = false;
  #      "PasswordManagerEnabled" = false;
  #      "SpellcheckEnabled" = true;
  #      "SpellcheckLanguage" = [ "en-US" ];
  #    };
  #    extensions = [
  #      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
  #      #"aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
  #    ];
  #  };
  #};

 #----- Home Manager Config -----
  home-manager.users.${username} = {

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

    programs = {
      firefox = {
        enable = true;
        profiles = {
          ${username} = {
            isDefault = true;
            settings = {
              "browser.startup.homepage" = "http://localhost:8080";
            };
          };
        };
      };
    };
  };
}

  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
    lock-empty-string = {
      Value = "";
      Status = "locked";
    };
  in {
    programs.firefox = {
      enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisablePocket = true;
      SearchBar = "unified";

      Preferences = {
        # Privacy settings
        "extensions.pocket.enabled" = lock-false;
        "browser.newtabpage.pinned" = lock-empty-string;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        "extension@tabliss.io" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/3940751/tabliss-2.6.0.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}

  home-manager.users.${username} = {

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

   home.programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "Default";
          isDefault = true;
          settings = {
            # "browser.startup.homepage" = "https://duckduckgo.com";
            "browser.search.defaultenginename" = "DuckDuckGo";
            "browser.search.order.1" = "DuckDuckGo";

            "signon.rememberSignons" = false;
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "browser.aboutConfig.showWarning" = false;
            "browser.compactmode.show" = true;
            "browser.cache.disk.enable" = false; # Be kind to hard drive

            "mousewheel.default.delta_multiplier_x" = 20;
            "mousewheel.default.delta_multiplier_y" = 20;
            "mousewheel.default.delta_multiplier_z" = 20;

            # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
            # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
            # then have Firefox open on some other workspace.
            "widget.disable-workspace-management" = true;
          };
          search = {
            force = true;
            default = "DuckDuckGo";
            order = [ "DuckDuckGo" "Google" ];
          };
        };
      };
    };
