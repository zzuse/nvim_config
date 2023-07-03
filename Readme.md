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
# open lua/zzuse/packer.lua exec source
:so
# install plugin
:PackerSync
```

# Fuzzy file finder
https://github.com/nvim-telescope/telescope.nvim
```shell
<leader>ff # file finder of telescope plugin, MODIFIED key adjust my habit
<leader>fg # git file finder of telescope plugin, MODIFIED key adjust my habit
<leader>ps # grep in files of telescope plugin
```
```lua
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
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

# Highlight color: Tree Sitter
https://github.com/nvim-treesitter/nvim-treesitter
https://github.com/nvim-treesitter/playground  # just an highlight AST play tool, not useful for me
```
:so # source out when you adding more languages
```

# Fast file list switch: 
ThePrimeagen/harpoon
```
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
```

# Undo (git commit tree like): 
mbbill/undotree
```
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
```

# Git manipulate: 
tpope/vim-fugitive
```
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
```

# Lsp (language server for complete, lint and format) 
https://github.com/VonHeikemen/lsp-zero.nvim
```vim
:Mason # choose which languge to support
```
```lua
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
```

# Others
```vim
:h rtp # runtime variable
"%" # create file 
"d" # create directory
"D" # delete a file
:Ex # back to explore directory, in the repo this command remapped to <leader>pv
:so # source to environment
:PackerSync # the Packer plugin manager
```

