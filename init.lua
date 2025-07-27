require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.list = true
vim.opt.listchars = {
	lead = "·", -- leading spaces
	trail = "·", -- trailing spaces
	tab = "▸ ", -- tabs
}

require("lazy").setup({
	require("plugins.theme"),
	require("plugins.neo-tree"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.nvim-autopairs"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.typescript-tools"),
	require("plugins.blink"),
	require("plugins.autocomplete"),
	require("plugins.csharp-lsp"),
	-- Not sure if I like it or not :///
	-- require("plugins.lsp-signature"),
	require("plugins.git-signs"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.markdown"),
	require("plugins.neogit"),
})
