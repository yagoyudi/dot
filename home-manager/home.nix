{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./bashrc.nix
    ./vimrc.nix
    ./foot.nix
    ./tmux.nix
    ./inputrc.nix
    ./sway.nix

    ./go.nix
    ./c.nix
  ];

  home.packages = with pkgs; [
    firefox

    pulsemixer
    imv
    mpv
    nix-prefetch-github
    tree
    grim
    slurp
    brightnessctl
    wl-clipboard

    libreoffice

    jetbrains-mono
    nerdfonts

    mupdf
    zathura

    bemenu
  ];

  home.username = "yf";
  home.homeDirectory = "/home/yf";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
