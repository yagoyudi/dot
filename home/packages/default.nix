{ ... }: {
  imports = [
    ./archive.nix
    ./c.nix
    ./go.nix
		./nix.nix
    ./downloader.nix
    ./kubectl.nix
    ./libreoffice.nix
    ./media.nix
    ./utility.nix
    ./wayland.nix
    ./starship.nix
    ./firefox.nix
    ./k8s.nix
  ];
}
