{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    wireshark
  ];

  programs.wireshark.enable = true;

  users.users.yf = {
    extraGroups = [ "wireshark" ];
  };
}
