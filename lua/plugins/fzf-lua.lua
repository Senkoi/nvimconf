if vim.g.vscode then
    return {}
end
local keys = {
    {
		"<C-p>",
		function()
			fzf.files()
		end,
		desc = "fzf browse files",
	},
	{
		"<C-b>",
	function()
			fzf.buffers()
		end,
		desc = "fzf browse buffers",
	},
	{
		"<F1>",
		function()
			fzf.help_tags()
		end,
		desc = "fzf help tags",
	},
	{
		'""',
		function()
			fzf.registers()
		end,
		desc = "fzf show registers",
	},
	{
		"<leader>gB",
		function()
			if require("utils").git_root() ~= nil then
				fzf.git_branches()
			else
				vim.notify("not a git repository", vim.log.levels.WARN)
			end
		end,
		desc = "fzf git branches",
	},
	{
		"<C-m>",
		function()
			vim.ui.input({ prompt = "search symbol: " }, function(sym)
				if not sym or sym == "" then
					return
				end
				fzf.lsp_workspace_symbols({ lsp_query = sym })
			end)
		end,
		desc = "fzf workspace symbols",
	},
	{
		"gm",
		function()
			fzf.lsp_document_symbols()
		end,
		desc = "fzf document symbols",
	},
	{
		"/",
		ft = "qf",
		function()
			require("plugins.fzf_extras").filter_qf()
		end,
		desc = "fzf filter quickfix",
	},
}

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = function()
      fzf = require("fzf-lua")
      return keys
  end,
}
