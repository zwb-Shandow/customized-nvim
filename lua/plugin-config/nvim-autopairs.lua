local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	vim.notify("not found nvim-autopairs")
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
