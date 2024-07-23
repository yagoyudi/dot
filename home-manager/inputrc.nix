{ config, pkgs, ... }:
{
  home.file.".inputrc".text = ''
    # Enable vi mode
    set editing-mode vi
    set show-mode-in-prompt on
    
    # Set completion-ignore-case on
    set completion-ignore-case on
    
    # Show all completions in a menu
    set show-all-if-ambiguous on
    
    # Allow case-insensitive completion
    set completion-ignore-case on
    
    # Use menu completion
    TAB: menu-complete
    set show-all-if-ambiguous on
    "\e[A": history-search-backward
    "\e[B": history-search-forward
    
    # Include system-wide settings
    $if mode=emacs
      "\C-p": history-search-backward
      "\C-n": history-search-forward
      "\e[A": history-search-backward
      "\e[B": history-search-forward
    $endif
  '';
}

