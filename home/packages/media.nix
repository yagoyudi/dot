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
          ffmpeg # convert video
          pulsemixer # audio volume
          mpv # video player
          imv # image viewer
        ];
      };
    };
  };
}
