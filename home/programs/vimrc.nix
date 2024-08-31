{ 
  pkgs,
  ...
}:
let
  name = "yf";
in {
  home-manager = {
    users.${name} = {
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

          autocmd FileType c,go setlocal shiftwidth=4 tabstop=4
          autocmd BufRead,BufNewFile *.h set filetype=c

          xnoremap "+y y:call system("wl-copy", @")<cr>
          nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', , 'g')<cr>p
          nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', , 'g')<cr>p
        '';
      };
    };
  };
}
