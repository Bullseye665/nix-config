{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    home.file = {

      ".config/i3/config".text = ''

        set $mod Mod1                               # Default modifier (Mod4 = Win / Mod1 = Alt)

                                                    # Font for window titles. Will also be used by the bar unless a different font
                                                    # is used in the bar {} block below.
        font pango:Noto Sans 8                      # Default = monospace 8

                                                    # This font is widely installed, provides lots of unicode glyphs, right-to-left
                                                    # text rendering and scalability on retina/hidpi displays (thanks to pango).
       # font pango:DejaVu Sans Mono 8

                                                    # Start XDG autostart .desktop files using dex. See also
                                                    # https://wiki.archlinux.org/index.php/XDG_Autostart
        exec --no-startup-id dex --autostart --environment i3

                                                    # The combination of xss-lock, nm-applet and pactl is a popular choice, so
                                                    # they are included here as an example. Modify as you see fit.

                                                    # xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
                                                    # screen before suspend. Use loginctl lock-session to lock your screen.
        exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

                                                    # NetworkManager is the most popular way to manage wireless networks on Linux,
                                                    # and nm-applet is a desktop environment-independent system tray GUI for it.
        exec --no-startup-id nm-applet

                                                    # Use pactl to adjust volume in PulseAudio.
        set $refresh_i3status killall -SIGUSR1 i3status
        bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
        bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
        bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
        bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status


        floating_modifier $mod+t                    # Use Mouse+$mod to drag floating windows to their wanted position
        tiling_drag modifier titlebar
# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.

        bindsym $mod+t exec i3-sensible-terminal    # start a terminal
        bindsym $mod+q kill                         # kill focused window

        bindsym $mod+d exec --no-startup-id dmenu_run
       # bindcode $mod+40 exec "rofi -modi drun,run -show drun" # A more modern dmenu replacement


        bindsym $mod+j focus left                   # change window focus
        bindsym $mod+k focus down
        bindsym $mod+l focus up
        bindsym $mod+semicolon focus right
        bindsym $mod+Left focus left
        bindsym $mod+Down focus down
        bindsym $mod+Up focus up
        bindsym $mod+Right focus right

        bindsym $mod+Shift+j move left              # move focused window
        bindsym $mod+Shift+k move down
        bindsym $mod+Shift+l move up
        bindsym $mod+Shift+semicolon move right
        bindsym $mod+Shift+Left move left
        bindsym $mod+Shift+Down move down
        bindsym $mod+Shift+Up move up
        bindsym $mod+Shift+Right move right

        bindsym $mod+h split h                      # split in horizontal orientation
        bindsym $mod+v split v                      # split in vertical orientation

        bindsym $mod+f fullscreen toggle            # enter fullscreen mode for the focused container

        bindsym $mod+s layout stacking              # change container layout
        bindsym $mod+w layout tabbed
        bindsym $mod+e layout toggle split
        bindsym $mod+Shift+space floating toggle    # toggle tiling / floating

        bindsym $mod+space focus mode_toggle        # change focus between tiling / floating windows
        bindsym $mod+a focus parent                 # focus the parent container
       # bindsym $mod+d focus child                  # focus the child container

        set $ws1 "1"                                # Define names for default workspaces for key bindings
        set $ws2 "2"                                # Use variables to avoid repeating the names in multiple places
        set $ws3 "3"
        set $ws4 "4"
        set $ws5 "5"
        set $ws6 "6"
        set $ws7 "7"
        set $ws8 "8"
        set $ws9 "9"
        set $ws10 "10"

        bindsym $mod+1 workspace number $ws1        # switch to workspace
        bindsym $mod+2 workspace number $ws2
        bindsym $mod+3 workspace number $ws3
        bindsym $mod+4 workspace number $ws4
        bindsym $mod+5 workspace number $ws5
        bindsym $mod+6 workspace number $ws6
        bindsym $mod+7 workspace number $ws7
        bindsym $mod+8 workspace number $ws8
        bindsym $mod+9 workspace number $ws9
        bindsym $mod+0 workspace number $ws10

        bindsym $mod+Shift+1 move container to workspace number $ws1 # move focused container to workspace
        bindsym $mod+Shift+2 move container to workspace number $ws2
        bindsym $mod+Shift+3 move container to workspace number $ws3
        bindsym $mod+Shift+4 move container to workspace number $ws4
        bindsym $mod+Shift+5 move container to workspace number $ws5
        bindsym $mod+Shift+6 move container to workspace number $ws6
        bindsym $mod+Shift+7 move container to workspace number $ws7
        bindsym $mod+Shift+8 move container to workspace number $ws8
        bindsym $mod+Shift+9 move container to workspace number $ws9
        bindsym $mod+Shift+0 move container to workspace number $ws10

        bindsym $mod+Shift+c reload                 # reload the configuration file
        bindsym $mod+Shift+r restart                # restart i3 inplace (preserves your layout/session)
        bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'xfce4-session-logout'"

                                                    # resize window (you can also use the mouse for that)
        mode "resize" {                             # These bindings trigger as soon as you enter the resize mode
                bindsym j resize shrink width 10 px or 10 ppt           # Pressing left will shrink the window’s width.
                bindsym k resize grow height 10 px or 10 ppt            # Pressing right will grow the window’s width.
                bindsym l resize shrink height 10 px or 10 ppt          # Pressing up will shrink the window’s height.
                bindsym semicolon resize grow width 10 px or 10 ppt     # Pressing down will grow the window’s height.
                bindsym Left resize shrink width 10 px or 10 ppt
                bindsym Down resize grow height 10 px or 10 ppt
                bindsym Up resize shrink height 10 px or 10 ppt
                bindsym Right resize grow width 10 px or 10 ppt

                bindsym Return mode "default"                           # back to normal: Enter or Escape or $mod+r
                bindsym Escape mode "default"
                bindsym $mod+r mode "default"
        }

        bindsym $mod+r mode "resize"

        bar {
                status_command i3status
        }
    '';
    };
  };
}
