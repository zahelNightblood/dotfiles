return {
	{
		dir = "~/projects/lua/test.nvim",
		config = function()
			require("present")
		end,
	},
	{
		dir = "~/projects/lua/runner.nvim",
		config = function()
			require("grab").setup()

			vim.api.nvim_create_user_command("PresentSyntaxNode", function()
				require("grab").run_block()
			end, {})

			vim.keymap.set("n", "<leader>ssn", ":PresentSyntaxNode<CR>", {
				desc = "Present Syntax Node",
			})
		end,
	},
}
