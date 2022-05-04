local opts = {
	settings = nil,
  on_attach = nil,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end
}
