{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    qemu_kvm
    libvirt
  ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  users.users.yf = {
    extraGroups = [ "libvirtd" ];
  };
}
