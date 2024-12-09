{ pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = "Mod1";
      terminal = "foot";
      menu = "rofi -show run";

      input = {
        "type:keyboard" = {
          xkb_layout = "br";
          repeat_rate = "50";
          repeat_delay = "300";
        };
        "type:touchpad" = { tap = "enabled"; };
      };

      startup = [
        { command = "${pkgs.foot}/bin/foot"; }
        { command = "${pkgs.firefox}/bin/firefox"; }
      ];

      assigns = {
        "2" = [
          { app_id = "zathura"; }
        ];
        "10" = [
          { app_id = "firefox"; }
        ];
      };

      keybindings = lib.mkOptionDefault {
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

        "XF86AudioMute" = "exec pulsemixer --toggle-mute";
        "XF86AudioLowerVolume" = "exec pulsemixer --change-volume -5";
        "XF86AudioRaiseVolume" = "exec pulsemixer --change-volume +5";
        "XF86AudioMicMute" = "exec pulsemixer --set-mute $(pulsemixer --list-sources | grep 'default' | awk '{print $1}') toggle";

        "Print" = ''exec grim -g "$(slurp -d)" - | wl-copy'';

        "Mod1+Shift+m" = ''output "eDP-1" toggle'';

        "Mod1+p" = "exec rofi-pass";

        "Mod1+Shift+p" = "mode passthrough";
      };

      bars = [{
        command = "echo 'no bar, btw'";
      }];

      fonts = {
        size = 11.0;
      };

      window = {
        border = 1;
        titlebar = false;
      };

      modes = {
        passthrough = {
          "Mod1+Shift+p" = "mode default";
        };
      };
    };

    extraConfig = ''
          workspace 1 output DP-1
          workspace 5 output eDP-1
    '';
  };
}
