require('nvim-autopairs').setup()

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(Rule("$","$","tex"))

local cond = require("nvim-autopairs.conds")

local exclude_filetypes = function(filetypes)
  local filetype = vim.fn.expand("%:e")
  for _, exclude in pairs(filetypes) do
    if filetype == exclude then
      return false
    end
  end
  return true
end

local tex = {'plaintex','tex','bib'}

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = exclude_filetypes(tex), -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})


