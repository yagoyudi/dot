{ programs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    clock24 = true;
    baseIndex = 1;
    mouse = true;
  };
}
