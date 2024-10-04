{ config, lib, pkgs, ... }:

{
  services = {
    blueman.enable = true;

    journald = {
      extraConfig = "SystemMaxUse=1G";
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql_14;
    };
  };
}
