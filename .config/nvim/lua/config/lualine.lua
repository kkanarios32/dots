local function clock()
  return os.date("%H:%M")
end

require('lualine').setup {
  options = {
    theme = "nord",
    icons_enabled = 1,
    section_separators = { " ", " " },
    component_separators = { " ", " " },
 --   section_separators = { "", "" },
 --   component_separators = { "", "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { clock },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

