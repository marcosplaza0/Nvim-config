local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    { name = 'buffer' },
  },
  mapping = {
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-CR>'] = cmp.mapping.confirm {
	    behavior = cmp.ConfirmBehavior.Replace,
	    select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_next_item()
	    else
		    fallback()
	    end
    end, { 'i', 's' }),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
	  -- Add borders to completions popups
	  completion = cmp.config.window.bordered(),
	  documentation = cmp.config.window.bordered(),
  },
})
