local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

plug_url_format = 'https://github.com/%s'

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

-- auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == '' then
  vim.api.nvim_echo({{'installing packer.nvim', 'type'}}, true, {})
  vim.cmd(install_cmd)
  vim.cmd('packadd packer.nvim') end

vim.cmd [[packadd packer.nvim]]

require('packer').startup({function(use)
  use({
    "wbthomason/packer.nvim",
    opt = true,
  })
  use({
    "nvim-lua/plenary.nvim",
    module = "plenary"
  })
  use({
    "nvim-lua/popup.nvim",
    module = "popup"
  })
  use({
    "p00f/nvim-ts-rainbow", 
    module = "nvim-ts-rainbow",
  })
  use({
    "neovim/nvim-lspconfig",
    module = "nvim-lspconfig",
  })
  use({
    "onsails/lspkind-nvim",
    module = "lspkind-nvim",
  })
  use({
    "rafamadriz/friendly-snippets", 
    module = "friendly-snippets",
  })
  use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({default = true})
    end,
  })
  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("config.autopairs")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    run = ":TSUpdate",
    branch = "0.5-compat",
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufRead",
    branch = "0.5-compat",
    wants = {
      "nvim-treesitter",
      "nvim-ts-rainbow",
    },
    config = function()
      require('config.treesitter')
    end,
  })
  use({
    "hrsh7th/cmp-nvim-lsp", 
    event = "BufReadPre",
    wants = "nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    module = "Telescope",
    keys = { "<C-f>" },
    wants = {
      "plenary.nvim",
      "popup.nvim",
    },
    config = function()
      require("config.telescope")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    wants = "plenary.nvim",
    requires = "plenary.nvim",
    config = function()
      require("config.gitsigns")
    end,
  })
  use({
    "edeneast/nightfox.nvim",
    event = "VimEnter",
    config = function() 
      require("config.nightfox")
    end,
  })
  use({
    "hoob3rt/lualine.nvim",
    event = "VimEnter",
    wants = "nvim-web-devicons",
    config = function()
      require("config.lualine")
    end,
  })
  use({
    {
      "tpope/vim-sleuth",
      event = "BufEnter",
      config = vim.cmd([[au BufEnter,BufWritePost * Sleuth]])
    },
    {
      "tpope/vim-commentary",
      event = "BufEnter"
    },
    {
      "tpope/vim-surround",
      event = "BufEnter",
    },
    {
      "tpope/vim-repeat",
      event = "BufEnter"
    },
  })
  use({
    "L3MON4D3/LuaSnip", 
    module = "LuaSnip",
    wants = "friendly-snippets",
    config = function()
      require("config.luasnip")
    end   
  })
  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    wants = { 
      "LuaSnip",
      "lspkind-nvim" 
    },
    requires = {
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp", },
      { "kdheepak/cmp-latex-symbols", after = "nvim-cmp", },
    },
    config = function()
      require("config.cmp")
    end
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    after = "nightfox.nvim",
    config = function()
      require("indent_blankline").setup {
        show_end_of_line = true,
        show_current_context = true,
      }
    end
  })
end,
config = {
  profile = {
    enable = true,
    threshold = 0,
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
  git = {
    default_url_format = plug_url_format
  }
}
})

