{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    programs.kitty = {
        settings = {
          confirm_os_window_close = 0;
          dynamic_background_opacity = false;
          enable_audio_bell = false;
          window_padding_width = 0;
          background_opacity = "0.3";
          background_blur = 2;
          tab_bar_edge = "top";
        };
    };
  };
}
