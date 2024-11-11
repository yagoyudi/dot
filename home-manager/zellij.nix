{ ... }: 

{
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      default_layout = "compact";
      theme = "gruvbox-dark";
    };
  };
}
