{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    clock24 = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    mouse = true;
  };
}
