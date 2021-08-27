local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

plug_url_format = 'https://github.com/%s'

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == '' then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
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
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({default = true})
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    branch = "0.5-compat",
  })
  use({
    {"nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-ts-rainbow",
      branch = "0.5-compat",
      config = function()
        require('config.treesitter')
      end,
    },
    {"p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
    },
    {"windwp/nvim-autopairs",
      after = "nvim-treesitter",
      config = function()
        require("config.autopairs")
      end
    },
  })
  use({
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("config.lsp.servers")
    end,
  })
  use({
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    requires = {
      {"L3MON4D3/LuaSnip",
        requires = "rafamadriz/friendly-snippets",   
        config = function()
          require("config.luasnip")
        end   
      },
    },
    config = function()
      require("config.compe")
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    module = "telescope",
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
    "akinsho/flutter-tools.nvim",
    ft = {"flutter", "dart"},
    requires = {
      "plenary.nvim",
    },
    config = function()
      require("config.lsp.flutter-tools")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    wants = "plenary.nvim",
    requires = { "plenary.nvim" },
    config = function()
      require("config.gitsigns")
    end,
  })
  use({
    "EdenEast/nightfox.nvim"
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
    {"tpope/vim-sleuth",
      event = "BufEnter",
      config = vim.cmd([[au BufEnter,BufWritePost * Sleuth]])
    },
    {"tpope/vim-commentary",
      event = "InsertEnter"},
    {"tpope/vim-surround",
      module = "vim-surround"},
    {"tpope/vim-repeat",
      wants = "vim-surround",
      event = "BufEnter"},
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
