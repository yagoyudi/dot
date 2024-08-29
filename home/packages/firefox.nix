{
  pkgs,
  ...
}:
with pkgs;
let
  name = "yf";
in {
  home-manager = {
    users.${name} = {
      home = {
        packages = [
          firefox
        ];
      };
    };
  };
}

