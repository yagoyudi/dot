{ pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod1";
      terminal = "foot";
      menu = "dmenu_run -l 10 -p Run";

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
        { command = "${pkgs.emacs}/bin/emacsclient -c"; }
      ];

      assigns = {
        "1" = [
          { app_id = "emacsclient"; }
          { app_id = "foot"; }
        ];
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

        "Mod1+p" = "exec passmenu";
      };
      bars = [{
        position = "top";
        statusCommand = "while $HOME/github.com/dotfiles/home-manager/status-bar.sh; do sleep 50; done";

        colors = {
          statusline = "#ffffff";
          background = "#323232";
          inactiveWorkspace = {
            background = "#323232";
            border = "#323232";
            text = "#5c5c5c";
          };
        };
        fonts = { size = 10.0; };
      }];
      fonts = { size = 10.0; };
      window = {
        border = 1;
        titlebar = true;
      };
    };
  };
}
