return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		local hop = require("hop")
		local directions = require("hop.hint").HintDirection
		hop.setup({})
		vim.keymap.set("n", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
		vim.keymap.set("", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })
		vim.keymap.set("n", "<leader>f", function()
			hop.hint_char2({ direction = directions.AFTER_CURSOR })
		end, { remap = true })
		vim.keymap.set("", "<leader>F", function()
			hop.hint_char2({ direction = directions.BEFORE_CURSOR })
		end, { remap = true })
		vim.keymap.set("", "t", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, { remap = true })
		vim.keymap.set("", "T", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, { remap = true })
	end,
}
