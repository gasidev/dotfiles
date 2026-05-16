local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- LazyVim must come first
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		-- LazyVim extras go here, if you use any
		-- { import = "lazyvim.plugins.extras.lang.typescript" },
		-- { import = "lazyvim.plugins.extras.lang.json" },

		-- Your own plugins go last
		{ import = "rodrigo.plugins" },
	},
	checker = {
		enabled = true,
		notify = false,
	},

	change_detection = {
		notify = false,
	},
})
