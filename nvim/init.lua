require("core.options")
require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.telescope"),
	require("plugins.whichkey"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.lspalt"),
	require("plugins.autocompletion"),
	require("plugins.statuscol"),
	require("plugins.gitsigns"),
	require("plugins.autoformatting"),
	require("plugins.dev"),
	require("plugins.lazydev"),
	require("plugins.markdown"),
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	group = vim.api.nvim_create_augroup("lua-hide-cmp", { clear = true }),
	callback = function(opts)
		require("cmp").setup.filetype("lua", {
			enabled = false,
		})
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = vim.api.nvim_create_augroup("lua-hide-cmp", { clear = true }),
	callback = function(opts)
		require("cmp").setup.filetype("markdown", {
			enabled = false,
		})
	end,
})
