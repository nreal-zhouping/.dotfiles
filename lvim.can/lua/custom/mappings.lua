-- https://www.lunarvim.org/docs/configuration/keybindings
lvim.lsp.buffer_mappings.normal_mode['gr'] = {
  "<cmd>lua require('telescope.builtin').lsp_references({layout_strategy='vertical',layout_config={width=0.618, height=0.618}})<CR>",
  "Goto references" }
lvim.lsp.buffer_mappings.normal_mode['gd'] = {
  "<cmd>lua vim.lsp.buf.definition({layout_strategy='vertical',layout_config={width=0.618, height=0.618}})<CR>",
  "Goto definition" }

lvim.builtin.telescope.defaults.dynamic_preview_title = true
lvim.builtin.telescope.theme = "ivy"
lvim.builtin.which_key.mappings['n'] = { '<cmd>NvimTreeFindFile<CR>', "File reveal" }

lvim.keys.normal_mode["<C-n>"] = { '<cmd>NvimTreeToggle<CR>' }
lvim.keys.normal_mode["<TAB>"] = { ":bnext<CR>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<S-TAB>"] = { ":bprevious<CR>", { noremap = true, silent = true } }
-- lvim.keys.normal_mode["<S-l>"] = { ":bnext<CR>", { noremap = true, silent = true } }
-- lvim.keys.normal_mode["<S-h>"] = { ":bprevious<CR>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<S-l>"] = { '<cmd>NvimTreeToggle<CR>' }
lvim.keys.normal_mode["<S-h>"] = { '<cmd>NvimTreeToggle<CR>' }


lvim.builtin.which_key.mappings["f"] = lvim.builtin.which_key.mappings["s"]
lvim.builtin.which_key.mappings["/"] = lvim.builtin.which_key.mappings["s"]["t"]
lvim.builtin.which_key.mappings["fs"] = { '<cmd>update<CR>', "Save" }
lvim.builtin.which_key.mappings["ff"] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files { previewer = true }
  end,
  "Find File",
}

lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>:set nospell<CR>", "Zen Mode" }

lvim.builtin.which_key.vmappings["fm"] = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format Selection" }

-- Nvimtree
lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  local function telescope_find_files(_)
    require("lvim.core.nvimtree").start_telescope "find_files"
  end

  local function telescope_live_grep(_)
    require("lvim.core.nvimtree").start_telescope "live_grep"
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  local useful_keys = {
    ["l"] = { api.node.open.edit, opts "Open" },
    ["o"] = { api.node.open.edit, opts "Open" },
    ["<CR>"] = { api.node.open.edit, opts "Open" },
    ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
    ["C"] = { api.tree.change_root_to_node, opts "CD" },
    ["gtg"] = { telescope_live_grep, opts "Telescope Live Grep" },
    ["gtf"] = { telescope_find_files, opts "Telescope Find File" },
    ["|"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["-"] = { api.node.open.horizontal, opts "Open: Horizontal Split" },
  }

  require("lvim.keymappings").load_mode("n", useful_keys)
end
