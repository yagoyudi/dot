{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/ecc35383-4162-4062-9b1e-710e0d03aba1";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/F83D-28E9";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };
}
