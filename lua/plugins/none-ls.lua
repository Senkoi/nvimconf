if vim.g.vscode then
	return {}
end
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
			},
		})
		vim.keymap.set("n", "<space>f", vim.lsp.buf.format, {})
	end,
}
