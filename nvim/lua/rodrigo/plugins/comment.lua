return {
	{
		"numToStr/Comment.nvim",
		opts = function(_, opts)
			local ok, ts_context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")

			if ok then
				opts.pre_hook = ts_context_commentstring.create_pre_hook()
			end

			return opts
		end,
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
	},
}
