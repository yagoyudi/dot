{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "nix-env-home-manager";

  buildInputs = with pkgs; [
    nixpkgs-fmt
    home-manager
  ];

  shellHook = ''
    echo "Nix environment with Home Manager!"
  '';
}

