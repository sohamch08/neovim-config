return {
	"lewis6991/gitsigns.nvim",
	config = function(_, opts)
		require("gitsigns").setup(opts)

		local function set_sign_colors()
			local colors = vim.o.background == "light"
				and { Add = "#287A36", Change = "#946000", Delete = "#C03646", Untracked = "#007C91" }
				or { Add = "#9ECE6A", Change = "#E0AF68", Delete = "#F7768E", Untracked = "#7DCFFF" }
			colors.Topdelete = colors.Delete
			colors.Changedelete = colors.Change
			for kind, color in pairs(colors) do
				for _, prefix in ipairs({ "GitSigns", "GitSignsStaged" }) do
					vim.api.nvim_set_hl(0, prefix .. kind, { fg = color, bold = true })
				end
			end
		end

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("GitSignColors", { clear = true }),
			callback = set_sign_colors,
		})
		set_sign_colors()
	end,
	opts = {
		signs = {
			add = { text = "▌" },
			change = { text = "▌" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "▌" },
		},
		signs_staged = {
			add = { text = "▌" },
			change = { text = "▌" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "▌" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		blame_formatter = nil, -- Use default
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	},
}
