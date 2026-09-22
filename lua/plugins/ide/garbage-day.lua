return {
	"Zeioth/garbage-day.nvim",
	event = "VeryLazy",
	opts = {
		aggressive_mode = false,
		grace_period = 60 * 15, -- Stop LSP clients after Neovim loses focus for 15 minutes.
		wakeup_delay = 0,
		notifications = false,
	},
}
