local custom = require('config.lsp')

require("flutter-tools").setup {
	lsp = {
		on_attach = custom["on_attach"],
		capabilities = custom["capabilites"],
	},
}

local util = require('util')

