{  config, pkgs, ...}:
{
  programs.vim = {
    enable = true;

    defaultEditor = true;

    settings = {
      background= "dark";
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    extraConfig = ''
      syntax on
      filetype plugin indent on

      set nobackup
      set noswapfile
      set nowrap

      set smartindent
      set autoindent

      autocmd FileType c setlocal shiftwidth=4 softtabstop=4
      autocmd BufRead,BufNewFile *.h set filetype=c

      xnoremap "+y y:call system("wl-copy", @")<cr>
      nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', , 'g')<cr>p
      nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', , 'g')<cr>p
      '';
  };
}

