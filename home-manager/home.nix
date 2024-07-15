{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./bashrc.nix
    ./vimrc.nix
    ./foot.nix
  ];

  home.packages = with pkgs; [
    firefox

    #CLI program
    pulsemixer #audio manager
    imv #image viewer
    nix-prefetch-github #get hash and head from github repo
    glow # markdown viewer terminal

    #App launcher
    bemenu

    #Video viewer
    haruna

    #Office suite
    libreoffice

    #Font
    jetbrains-mono
    nerdfonts
  ];

  home.username = "yf";
  home.homeDirectory = "/home/yf";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
