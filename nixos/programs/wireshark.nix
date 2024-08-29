{ ... }:
let
  name = "yf";
in {
  programs.wireshark.enable = true;
  users.users.${name} = {
    extraGroups = [
      "wireshark"
    ];
  };
}
