{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./bashrc.nix
    ./vimrc.nix
    ./foot.nix
    ./sway.nix
    ./inputrc.nix
  ];

  home.packages = with pkgs; [
    firefox

    pulsemixer
    imv
    mpv
    nix-prefetch-github
    tcpdump

    libreoffice

    jetbrains-mono
    nerdfonts

    zathura

    starship
  ];

  home.username = "yf";
  home.homeDirectory = "/home/yf";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
