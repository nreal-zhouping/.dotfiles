-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
return function()
  require('bufferline').setup({
    options = {
      show_buffer_icons = true,
      show_close_icon = false,
      show_buffer_close_icons = false,
      -- 使用 nvim 内置 LSP
      diagnostics = 'nvim_lsp',
      -- diagnostics_indicator = function(count, level) return '(' .. count .. ')' end,
      --[[ diagnostics_indicator = function(count, level)
      local icon = level:match("error") and "" or level:match('warning') and "" or ''
      return " " .. icon .. count
    end, ]]
      --diagnostics_indicator = function(count, level, diagnostics_dict, context)
      --  local s = " "
      --  for e, n in pairs(diagnostics_dict) do
      --    local sym = e == "error" and "" or
      --                    (e == "warning" and "" or "")
      --    s = s .. sym .. n
      --  end
      --  return s
      --end
      -- For 8|² -
      numbers = function(opts)
        --return string.format('%s|%s.)', opts.id, opts.raise(opts.ordinal))
        return string.format('%s)', opts.raise(opts.ordinal))
      end,
      -- offsets = {{filetype = "NvimTree", text = "NvimTree"}}
    },
  })
end
