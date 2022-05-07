vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "https://github.com/zwb-Shandow/customized_nvim" }

vim.g.dashboard_custom_section = {
	a = { description = { "  Recently projects      " }, command = "Telescope projects" },
	b = { description = { "  Recently files         " }, command = "Telescope oldfiles" },
	c = { description = { "  Find file              " }, command = "Telescope find_files" },
	d = { description = { "  Find text              " }, command = "Telescope live_grep" },
	e = { description = { "  Edit .bashrc           " }, command = "edit ~/.bashrc" },
	-- f = { description = { "  Edit keybindings       " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
	-- g = { description = { "  Edit init.lua          " }, command = "edit ~/.config/nvim/init.lua" },
}

vim.g.dashboard_custom_header = {
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	[[                                                   ]],
	[[                [ version : 1.0.0 ]                ]],
}
