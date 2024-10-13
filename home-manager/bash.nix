{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    enableCompletion = true;

    shellAliases = {
      ll = "ls -l --color";
      k = "kubectl";
    };

    initExtra = ''
      source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';

    sessionVariables = {
      PATH = "$PATH:$HOME/go/bin";
    };

    bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };
}
