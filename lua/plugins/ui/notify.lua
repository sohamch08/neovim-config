return {
	"rcarriga/nvim-notify",
	lazy = true,
	opts = {
		background_colour = "#000000",
		render = "compact",
		stages = "slide",
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)
		vim.notify = notify
	end,
}
