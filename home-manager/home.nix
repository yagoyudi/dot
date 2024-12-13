{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./foot.nix
    ./git.nix
    ./xdg.nix
    ./gpg.nix
    ./rofi.nix
    ./pass.nix
  ];

  nixpkgs = {
    overlays = [
      /*
      (final: prev: {
        dwl = prev.dwl.override {
          conf = ./config.h;
        };
      })
      */
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "yf";
    homeDirectory = "/home/yf";
    stateVersion = "24.11";
  };

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
