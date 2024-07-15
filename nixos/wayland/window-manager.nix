{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    sway
    wayland
    grim
    slurp
    wl-clipboard
    mako
  ];

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

}
