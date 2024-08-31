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
          {
            plugin = nvim-lspconfig;
            type = "lua";
            config = ''
							local lspconfig = require("lspconfig")

							-- disable signcolumn signals
							vim.diagnostic.config({signs = false})

						 	-- gopls
							lspconfig.gopls.setup({})
							vim.api.nvim_create_autocmd("BufWritePre", {
									pattern = "*.go",
									callback = function()
										local params = vim.lsp.util.make_range_params()
										params.context = {only = {"source.organizeImports"}}
										local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
										for cid, res in pairs(result or {}) do
											for _, r in pairs(res.result or {}) do
												if r.edit then
													local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
													vim.lsp.util.apply_workspace_edit(r.edit, enc)
												end
											end
										end
										vim.lsp.buf.format({async = false})
									end
							})

							-- nix lsp
							require'lspconfig'.nil_ls.setup{}
            '';
          }
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

