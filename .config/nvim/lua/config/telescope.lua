local actions = require("telescope.actions")
require("telescope").setup{
defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim", -- add this value
    },
    pickers = {
      find_files = {
        hidden=true,
        no_ignore=true
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
}
}
