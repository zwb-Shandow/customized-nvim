local formatter = require("utils").requirePlugin("formatter")

formatter.setup({
	filetype = {
		cpp = {
			-- clang-format
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file
				}
			end,
		},

		python = {
			function()
				return {
					exe = "python3 -m autopep8",
					args = {
						"--in-place --aggressive --aggressive",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
					},
					stdin = false,
				}
			end,
		},
		sh = {
			-- shell script formatter
			function()
				return {
					exe = "shfmt",
					args = { "-i", 2 },
					stdin = true,
				}
			end,
		},
		cmake = {
			function()
				return {
					exe = "cmake-format",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
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
