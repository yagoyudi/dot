{ ... }: {
  security = {
		pam.services.swaylock = {};
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}
