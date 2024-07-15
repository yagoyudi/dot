{config, pkgs, ...}:
{
  programs.bash = {
    enable = true;

    enableCompletion = true;

    shellAliases = {
      ll = "ls -l --color";
      vi="vim";
    };

    bashrcExtra = ''
      set -o vi
      export EDITOR=vi
      eval "$(starship init bash)"
    '';
  };
}
