{ ... }:
let
  name = "yf";
in {
  home-manager = {
    users.${name} = {
      services = {
        mako = {
          enable = true;
        };
      };
    };
  };
}
