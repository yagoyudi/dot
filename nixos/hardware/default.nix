{ modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./cpu.nix
    ./filesystem.nix
    ./opengl.nix
  ];
}
