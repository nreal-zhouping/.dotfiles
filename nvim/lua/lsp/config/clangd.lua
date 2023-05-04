-- ~/.local/share/nvim/site/pack/packer/start/nvim-lspconfig/lua/lspconfig/server_configurations/clangd.lua
local opts = {
  cmd = { 'clangd', '--background-index', '--compile-commands-dir=~/compile_commands.d/' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  settings = {},
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)
    -- 保存时自动格式化
    -- vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end,
}

return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
