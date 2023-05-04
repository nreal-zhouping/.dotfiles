return function ()
  require('lsp_signature').setup({
    handler_opts = {
      border = 'none'   -- double, single, shadow, none
    },
    hint_prefix = " ",
    toggle_key = '<M-s>'
  })
end
