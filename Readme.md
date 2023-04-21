# Why
I was using vim for many years, but I found nvim is more beautiful. So, maybe I will convert all my vim old scripts to nvim lua scripts. Here will be my configure repo...

# Ref
*   [0 to LSP: Neovim RC from Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&list=WL&index=44)
*   https://github.com/ThePrimeagen/init.lua

# Plugin Manager
https://github.com/wbthomason/packer.nvim
```shell
# install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# open lua/zzuse/packer.lua export source
:so
# install plugin
:PackerSync
```

# Fuzzy file finder
https://github.com/nvim-telescope/telescope.nvim
```lua
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") });
```

# Color: Rose Pine
https://github.com/rose-pine/neovim
```lua
use({
          'rose-pine/neovim',
          as = 'rose-pine',
          config = function()
                  vim.cmd('colorscheme rose-pine')
          end
  })
```

# Tree Sitter
https://github.com/nvim-treesitter/nvim-treesitter
https://github.com/nvim-treesitter/playground

# file list switch: 
ThePrimeagen/harpoon
# git branch edit: 
mbbill/undotree
# git operate: 
tpope/vim-fugitive

# lsp (language server)
https://github.com/VonHeikemen/lsp-zero.nvim
