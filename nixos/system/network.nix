{ lib, ... }: {
  networking = {
    hostName = "swift3";
    useDHCP = lib.mkDefault true;
    extraHosts = ''
      192.168.18.2 homelab
    '';
    networkmanager.enable = true;
  };
}
