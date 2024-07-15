{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName  = "Yago Furuta";
    userEmail = "yagofuruta@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
