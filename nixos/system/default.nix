{ ... }: {
  imports = [
    ./sound.nix
    #./firewall.nix
    ./bluetooth.nix
    ./boot.nix
    ./console.nix
    ./fonts.nix
    ./locale.nix
    ./manpages.nix
    ./network.nix
    ./security.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
  ];

  system.stateVersion = "24.05";
}
