if vim.g.vscode then
	return {}
end
return {
	"SirVer/ultisnips",
	dependencies = {
		"honza/vim-snippets",
	},
	event = "InsertEnter",
}
