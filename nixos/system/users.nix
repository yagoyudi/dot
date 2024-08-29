{ ... }:
let name = "yf";
in {
  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };
}
