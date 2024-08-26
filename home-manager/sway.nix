{  config, lib, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1";
      terminal = "foot";
      menu = "bemenu-run -p Run -l 10";
      input = {
        "type:keyboard" = {
          xkb_layout = "br";
          repeat_rate = "50";
          repeat_delay = "300";
        };
        "type:touchpad" = {
          tap = "enabled";
        };
      };
      keybindings = lib.mkOptionDefault {
        # Brightness
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

        # Volume
        "XF86AudioMute" = "exec pulsemixer --toggle-mute";
        "XF86AudioLowerVolume" = "exec pulsemixer --change-volume -5";
        "XF86AudioRaiseVolume" = "exec pulsemixer --change-volume +5";
        "XF86AudioMicMute" = "exec pulsemixer --set-mute $(pulsemixer --list-sources | grep 'default' | awk '{print $1}') toggle";

        # Print
        "Print" = "exec grim -g \"$(slurp -d)\" - | wl-copy";
      };
      bars = [
        {
          position = "top";
          statusCommand = "while date +'%H:%M %d/%m/%Y'; do sleep 1; done";
          colors = {
            statusline = "#ffffff";
            background = "#323232";
            inactiveWorkspace = {
              background = "#323232";
              border = "#323232";
              text = "#5c5c5c";
            };
          };
          fonts = {
            size = 10.0;
          };
        }
      ];
      fonts = {
        size = 10.0;
      };
      window = {
        border = 1;
        titlebar = true;
      };
    };
  };
}

