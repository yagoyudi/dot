{ ... }:
let
  name = "yf";
in {
  home-manager = {
    users.${name} = {
      home.file.".inputrc".text = ''
        set editing-mode vi
        set show-mode-in-prompt on

        set completion-ignore-case on

        set show-all-if-ambiguous on

        TAB: menu-complete
        set show-all-if-ambiguous on
        "\e[A": history-search-backward
        "\e[B": history-search-forward
      '';
    };
  };
}
