return {
	'akinsho/bufferline.nvim',
	version = "4",


	config = function()
		local bufferline = require"bufferline"
		bufferline.setup({
		options = {
            indicator = {
                style = "underline",
            },
			buffer_close_icon = "x"
		}}
		)

		vim.keymap.set("n", "<C-j>", function() vim.cmd("BufferLineCycleNext") end)
		vim.keymap.set("n", "<C-h>", function() vim.cmd("BufferLineCyclePrev") end)
		vim.keymap.set("n", "<leader>dd", function() vim.cmd("bdelete") end)
	end
}
