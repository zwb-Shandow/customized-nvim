vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "https://github.com/zwb-Shandow/customized_nvim" }

vim.g.dashboard_custom_section = {
  a = { description = { "  Recently files        " }, command = "Telescope oldfiles" },
  b = { description = { "  Find file          " }, command = "Telescope find_files" },
  c = { description = { "  Find text          " }, command = "Telescope live_grep" },
  d = { description = { "  Edit .bashrc          " }, command = "edit ~/.bashrc" },
  -- e = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
  -- f = { description = { "  Edit init.lua         " }, command = "edit ~/.config/nvim/init.lua" },
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
