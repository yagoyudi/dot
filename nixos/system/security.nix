{ ... }: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}
