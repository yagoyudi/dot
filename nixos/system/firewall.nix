{ ... }: {
  networking = {
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [
      ];
      allowedUDPPorts = [
      ];
      connectionTrackingModules = [
      ];
    };
  };
}

