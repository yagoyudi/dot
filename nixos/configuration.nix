{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>

    ./hardware-configuration.nix

    ./libvirt.nix
    ./prompt.nix

    ./audio.nix

    ./network.nix

    ./wayland/general.nix
    ./wayland/window-manager.nix
    ./wayland/login-manager.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Sao_Paulo";

   # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };

  users.users.yf = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  environment.systemPackages = with pkgs; [
    vim
    wireshark
  ];

  system.stateVersion = "22.11";
}
