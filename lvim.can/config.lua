-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },

  { 'tanvirtin/monokai.nvim', },

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("custom.config.zen").config()
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "fd" },   -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
        keys = "<Esc>",             -- keys used for escaping, if it is a function will use the result everytime
      })
    end,
  },
  { 'ojroques/nvim-osc52' },
}

lvim.colorscheme = "monokai"
lvim.builtin.lualine.style = "lvim" -- or "none"
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
local components = require "lvim.core.lualine.components"
-- define a filename component which show the relative path to your file with icons
-- local filename_component = function()
--   local file = vim.fn.expand "%:."
--   if vim.fn.empty(file) == 1 then
--     return ""
--   end
--   if string.len(file) > 100 then
--     file = vim.fn.pathshorten(file)
--   end
--   return lvim.icons.ui.Pencil .. " " .. file .. " "
-- end

local  filename_component = {
  function()
    local file = vim.fn.expand "%:."
    if vim.fn.empty(file) == 1 then
      return ""
    end
    if string.len(file) > 100 then
      file = vim.fn.pathshorten(file)
    end
    return lvim.icons.ui.Pencil .. " " .. file .. " "
  end,
  color = function()
    local colors = require "lvim.core.lualine.colors"
    local buf = vim.api.nvim_get_current_buf()
    -- if buffer is modified
    local mod = vim.api.nvim_buf_get_option(buf, "modified")
    return { fg = not mod and colors.green or colors.red, gui = "bold" }
  end,
  cond = nil,
}

lvim.builtin.lualine.sections.lualine_c = { components.diff, components.python_env, filename_component }

--
-- require('custom/plugins/lualine')
require('custom/plugins/lsp')
require('custom/mappings')
-- vim.cmd('source ~/.config/lvim/lua/custom/plugins/lualine.lua')
lvim.builtin.nvimtree.setup.git.ignore = true

-- For intendation
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
