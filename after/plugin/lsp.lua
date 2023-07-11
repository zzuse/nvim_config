local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
})

-- completion C-p previous, C-n next
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<S-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-y>'] = cmp.mapping.confirm({ select = true }),
    ['<S-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.setup()
