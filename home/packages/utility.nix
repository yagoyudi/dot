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
        ];
      };
    };
  };
}

