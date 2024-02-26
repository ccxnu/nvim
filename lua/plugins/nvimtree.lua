return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>" },
	},
	opts = {
		sort_by = "extension",

		view = {
			adaptive_size = true,
			side = "left",
			width = 28,
			preserve_window_proportions = true,
		},

		git = {
			enable = true,
			ignore = false,
		},

		filesystem_watchers = {
			enable = true,
		},

		actions = {
			open_file = {
				resize_window = true,
			},
		},
	},
}
