require('nvim-autopairs').setup()

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(Rule("$","$","tex"))

local cond = require("nvim-autopairs.conds")

local tex = {'plaintex','tex','bib'}

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  auto_select = true, -- automatically select the first item
  map_char = {
    tex = "{",
  }
})


