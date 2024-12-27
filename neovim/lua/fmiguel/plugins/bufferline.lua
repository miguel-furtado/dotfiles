return {
	"akinsho/bufferline.nvim",
	version = "4",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				indicator = {
					style = "underline",
				},
				buffer_close_icon = "x",
			},
		})
		vim.keymap.set("n", "<leader>dd", function()
			vim.cmd("bdelete")
		end)
		vim.keymap.set("n", "<C-h>", function()
			require("bufferline").go_to(1)
		end)
		vim.keymap.set("n", "<C-j>", function()
			require("bufferline").go_to(2)
		end)
		vim.keymap.set("n", "<C-k>", function()
			require("bufferline").go_to(3)
		end)
		vim.keymap.set("n", "<C-l>", function()
			require("bufferline").go_to(4)
		end)
		vim.keymap.set("n", "<C-ç>", function()
			require("bufferline").go_to(5)
		end)
		vim.keymap.set("n", "<C-p>", function()
			vim.cmd("BufferLineMovePrev")
		end)
		vim.keymap.set("n", "<C-n>", function()
			vim.cmd("BufferLineMoveNext")
		end)
		vim.keymap.set("n", "<leader><leader>", function()
			vim.cmd("BufferLinePick")
		end)
	end,
}
