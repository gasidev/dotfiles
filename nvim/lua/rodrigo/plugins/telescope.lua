return {
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local actions = require("telescope.actions")

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			})

			return opts
		end,
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		},
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			pcall(function()
				require("telescope").load_extension("fzf")
			end)
		end,
	},

	{
		"folke/todo-comments.nvim",
		opts = {},
		keys = {
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
			{ "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Find TODO/FIX/FIXME" },
		},
	},
}
