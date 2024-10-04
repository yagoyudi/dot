{ config, lib, pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  /*
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk if desired
    #defaultEditor = true;
  };
  */
}
