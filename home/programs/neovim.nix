{ 
  pkgs,
  ...
}:
let
  name = "yf";
in {
  home-manager = {
    users.${name} = {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        extraLuaConfig = ''
          vim.g.mapleader = ' '
          vim.g.maplocalleader = ' '

          vim.opt.backup = false
          vim.opt.swapfile = false
          vim.opt.wrap = false

          vim.opt.guicursor = "n-v-i-c:block-Cursor"

          vim.api.nvim_create_autocmd({"FileType"}, {
                  pattern = {"c", "go"},
                  command = "setlocal shiftwidth=4 tabstop=4"
          })
          vim.api.nvim_create_autocmd({"FileType"}, {
                  pattern = {"yaml", "nix"},
                  command = "setlocal shiftwidth=2 tabstop=2"
          })
        '';
        plugins = with pkgs.vimPlugins; [
          vim-nix
          {
            plugin = telescope-nvim;
            type = "lua";
            config = ''
              local builtin = require('telescope.builtin')
              vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
              vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
              vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            '';
          }
          telescope-fzf-native-nvim
          (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-go
          ]))
        ];
      };
    };
  };
}

