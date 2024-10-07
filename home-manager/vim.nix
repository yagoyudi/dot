{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;

    settings = {
      background = "dark";
      shiftwidth = 2;
      tabstop = 2;
    };

    plugins = with pkgs.vimPlugins; [
      vim-go
      vim-terraform
    ];

    extraConfig = ''
      syntax on
      filetype plugin indent on

      set nobackup
      set noswapfile
      set nowrap
      set smartindent
      set smarttab
      set autoindent
      set paste
      set clipboard=unnamedplus
    '';
  };
}
