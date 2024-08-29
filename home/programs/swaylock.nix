{ ... }:
let name = "yf";
in {
  home-manager = {
    users.${name} = {
      programs.swaylock = {
        enable = true;
      };
    };
  };
}

