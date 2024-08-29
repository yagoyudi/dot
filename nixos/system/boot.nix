{ config, pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules =
        [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
      luks.devices."luks-dd006e3c-0ed3-4ba0-b28a-51f8a553024b".device =
        "/dev/disk/by-uuid/dd006e3c-0ed3-4ba0-b28a-51f8a553024b";
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
}
