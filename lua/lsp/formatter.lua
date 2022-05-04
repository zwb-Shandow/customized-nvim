local status, formatter = pcall(require, "formatter")
if not status then
	vim.notify("not found formatter")
	return
end

formatter.setup({
	filetype = {
		cpp = {
			-- clang-format
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file
					}
			end
		},

		python = {
			function()
				return {
					exe = "python3 -m autopep8",
					args = {
						"--in-place --aggressive --aggressive",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
					},
					stdin = false
			}
			end
		},
	}
})

-- format on save
vim.api.nvim_exec(
	[[
		augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost *.lua FormatWrite
		augroup END
	]],
	true
)
