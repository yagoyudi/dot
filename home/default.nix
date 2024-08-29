{ ... }:
let
  name = "yf";
  version = "24.05";
in {
  imports = [
    <home-manager/nixos>
    ./packages
    ./programs
    ./services
    ./xdg
  ];

  home-manager = {
    useGlobalPkgs = true;
    users.${name} = {
      home = {
        username = "${name}";
        homeDirectory = "/home/${name}";
        stateVersion = "${version}";
      };
    };
  };
}
