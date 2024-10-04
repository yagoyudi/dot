{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./sway.nix
    ./neovim.nix
    ./bash.nix
    ./foot.nix
    ./git.nix
    ./tmux.nix
    ./xdg.nix
    #./emacs.nix
    ./gpg.nix
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
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
    stateVersion = "24.05";
  };

  home.file.".inputrc".text = ''
    set editing-mode vi
    set show-mode-in-prompt on

    set completion-ignore-case on

    set show-all-if-ambiguous on

    TAB: menu-complete
    set show-all-if-ambiguous on
    "\e[A": history-search-backward
    "\e[B": history-search-forward
  '';

  home.packages = with pkgs; [
    # prompt
    starship

    # office suite
    libreoffice

    # dev
    gcc
    gnumake
    go
    nil # nix lsp

    # k8s
    kubectl-neat

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

    tree # view in files tree structure
    grim # screenshot
    slurp # select area
    nix-prefetch-github
    brightnessctl # control brightness
    dmenu # application launcher
    speedtest-go # test network speed
    ranger # file manager on terminal
    nmap # scan network
    jq # parse json
    pass # password-store
    gnupg
    pinentry
    cmake
    libtool
    pandoc

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

    axel # console downloading program
    downonspot # spotify downloader written in rust
    libgen-cli # used to access the library genesis dataset
    tdl # telegram downloader/tools written in golang
    wget # cli downloader
    youtube-tui # an aesthetically pleasing youtube tui
    ytmdl # youtube music downloader
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
