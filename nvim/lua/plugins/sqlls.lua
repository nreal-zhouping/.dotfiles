return function ()
  require('lspconfig').sqlls.setup({
  on_attach = function(client)
    client.resolved_capabilities.execute_command = true
    require('sqlls').setup()
  end
})
end
