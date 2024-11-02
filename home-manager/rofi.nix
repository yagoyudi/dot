{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
      stores = [ "$HOME/github.com/yagoyudi/pass" ];
    };
  };
}
