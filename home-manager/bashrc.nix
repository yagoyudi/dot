{config, pkgs, ...}:
{
  programs.bash = {
    enable = true;

    enableCompletion = true;

    shellAliases = {
      ll = "ls -l --color";
      vi="vim";
    };

    initExtra = ''
      source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';

    sessionVariables = {
      PATH = "$PATH:$HOME/go/bin";
    };

    bashrcExtra = ''
      set -o vi
      eval "$(starship init bash)"
    '';
  };
}
