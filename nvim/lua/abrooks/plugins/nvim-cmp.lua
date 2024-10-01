return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require 'cmp'

    local luasnip = require 'luasnip'

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    luasnip.config.setup {}

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-n>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),        -- close completion window
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- snippets
        { name = 'buffer' },  -- text within current buffer
        { name = 'path' },    -- file system paths
      },
    }
  end,
}
