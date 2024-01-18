-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
}


local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCycleNext <CR>")
-- vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCyclePrev <CR>")
lvim.keys.normal_mode["C-s"] = {"<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>"}
lvim.keys.normal_mode["<C-l>"] = {"<cmd>BufferLineCycleNext <CR>"}
lvim.keys.normal_mode["<C-h>"] = {"<cmd>BufferLineCyclePrev <CR>"}
lvim.keys.normal_mode["<C-n>"] = { '<cmd>NvimTreeToggle<CR>' }
lvim.keys.normal_mode["<C-g>"] = { '<cmd>call codeium#Accept<CR>' }
lvim.keys.normal_mode["<C-;>"] = { '<cmd>call codeium#CycleCompletions(1)<CR>' }
lvim.keys.normal_mode["<C-,>"] = { '<cmd>call codeium#CycleCompletions(-1)<CR>' }
lvim.keys.normal_mode["<C-x>"] = { '<cmd>call codeium#Clear()<CR>' }


