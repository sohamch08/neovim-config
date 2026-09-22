return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		messages = {
			enabled = true,
			view = "mini",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		notify = {
			enabled = true,
			view = "notify",
		},
		lsp = {
			hover = { enabled = false },
			signature = { enabled = false },
		},
		presets = {
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	},
}
