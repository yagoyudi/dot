{ ... }:

{
  programs.git = {
    enable = true;
    userName = "yago yudi";
    userEmail = "yagofuruta@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
