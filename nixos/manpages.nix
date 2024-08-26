{ environemnt, pkgs, documentation, ... }:
{
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];
  documentation.enable = true;
  documentation.man.enable = true;
  documentation.man = {
    man-db.enable = true;
  };
  documentation.dev.enable = true;
}
