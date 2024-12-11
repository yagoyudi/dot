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
    ./sway.nix
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

  home.file = {
    ".bashrc".source = ./bashrc;
    ".bash_profile".source = ./bash_profile;
    ".config/starship.toml".source = ./starship.toml;
    ".config/river/init".source = ./init;
    ".config/fish/config.fish".source = ./config.fish;
    ".inputrc".source = ./inputrc;

    ".vimrc".source = ./vimrc;
    ".tmux.conf".source = ./tmux.conf;
  };

  home.packages = with pkgs; [
    # prompt
    starship

    # office suite
    libreoffice

    # c
    gcc
    gnumake

    # go
    go
    gopls # go lsp
    gotools # godoc, etc...
    go-migrate # sql migrations
    mage # make, but in go

    # zig
    zig

    # nix
    nil # nix lsp

    # md
    marksman

    # java
    jre8
    jdk8
    maven

    # python
    python3Full

    # rust
    cargo
    rustc

    # js
    nodejs_23

    # k8s
    kubectl
    kubernetes-helm
    talosctl

    # media
    ffmpeg # convert video
    pulsemixer # audio volume
    mpv # video player
    imv # image viewer

    # archive
    atool
    bzip2
    gzip
    libarchive
    lz4
    lzip
    lzo
    lzop
    p7zip
    rzip
    unzip
    xz
    zip
    zstd

    # CLI
    tree # view in files tree structure
    grim # screenshot
    slurp # select area
    nix-prefetch-github
    brightnessctl # control brightness
    speedtest-go # test network speed
    nmap # scan network
    jq # parse json
    gnupg
    pinentry
    cmake
    libtool
    pandoc
    vim-full
    tmux
    fish
    w3m
    ripgrep
    eza
    bat
    gh
    neovim

    alacritty
    dwl
    river
    emacs
    wireshark
    sioyek

    swaykbdd # per-window keyboard layout for sway
    wayland-utils # wayland utilities (wayland-info)
    wl-clip-persist # keep wayland clipboard even after programs close
    wl-clipboard # command-line copy/paste utilities
    wf-recorder # record screen
    wlprop # xprop clone for wlroots based compositors
    wvkbd # on-screen keyboard for wlroots
    waypipe
    dmenu-wayland
    swaylock
  ];

  programs = {
    home-manager.enable = true;
  };

  services = {
    mako.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
