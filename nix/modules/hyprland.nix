{ ... }:
{
  programs.waybar.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$browser" = "brave";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show combi";
      "$clipboard" = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy";
      # exec-once = ["wl-paste --type text --watch cliphist store" # Stores only text data
      #   "wl-paste --type image --watch cliphist store" # Stores only image data
      # ];

      general = {
        gaps_in = 3;
        gaps_out = 12;

        border_size = 0;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        "layout" = "master";
      };

      decoration = {
        rounding = 5;

        # Change transparency of focused and unfocused windows
        inactive_opacity = 0.8;
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 3.79, easeOutQuint"
          "windowsIn, 1, 3.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 0.94, almostLinear, slidefade"
          "workspacesIn, 1, 0.21, almostLinear, slidefade"
          "workspacesOut, 1, 0.94, almostLinear, slidefade"
        ];
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };

      input = {
        kb_layout = "us,ir";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };
      };

      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
        " 1, monitor:HDMI-A-1"
        " 2, monitor:HDMI-A-1"
        " 3, monitor:HDMI-A-1"
        " 4, monitor:HDMI-A-1"
        " 5, monitor:eDP-1"
        " 6, monitor:eDP-1"
      ];

      monitor = [
        "eDP-1,1920x1080@144,1920x0,1"
        "HDMI-A-1,1920x1080@60,0x0,auto"
      ];

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, Q, killactive,"
        "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "$mod, E, exec, $fileManager"
        "$mod, W, exec, $browser"
        "$mod, space, exec, $menu"
        "$mod, V, exec, $clipboard"
        "$mod, F, togglefloating,"

        " , PRINT, exec, hyprshot --freeze -m region --clipboard-only"
        "SHIFT, PRINT, exec, hyprshot --freeze -m window"

        # "$mod, SHIFT, l, exec, hyprlock"

        "$mod, left, movefocus, l"
        "$mod, H, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, L, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, K, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, J, movefocus, d"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        " ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        " ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        " ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        " ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        " ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        " ,XF86AudioNext, exec, playerctl next"
        " ,XF86AudioPause, exec, playerctl play-pause"
        " ,XF86AudioPlay, exec, playerctl play-pause"
        " ,XF86AudioPrev, exec, playerctl previous"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
      ];
    };
  };
}
