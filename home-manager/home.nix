{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./bashrc.nix
    ./vimrc.nix
    ./foot.nix
    ./sway.nix
  ];

  home.packages = with pkgs; [
    firefox

    #CLI program
    pulsemixer #audio manager
    imv #image viewer
    mpv
    nix-prefetch-github #get hash and head from github repo
    tcpdump

    #Office suite
    libreoffice

    #Font
    jetbrains-mono
    nerdfonts

    zathura
  ];

  home.username = "yf";
  home.homeDirectory = "/home/yf";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
