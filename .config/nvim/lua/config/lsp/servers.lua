local setup, lspconfig = pcall(require, "lspconfig")

if not setup then
    return
end

local custom = require('config.lsp')

local servers = {
  texlab = {},
  clangd = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    on_attach = custom["on_attach"],
    capabilities = custom["capabilities"],
    flags = {
      debounce_text_changes = 150,
    },
  }, config))
end

