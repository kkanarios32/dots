require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<ESC>'] = "close",
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  winblend = 10,
}

local util = require("util")
local telescope = require("telescope.builtin")


local function project_files(opts)
  local opts = opts or {}
  local git = pcall(telescope.git_files, opts)
  if git then 
    return telescope.git_files(opts)
  else
    return telescope.find_files(opts)
  end
end
    

util.nnoremap('<C-f>',project_files)
