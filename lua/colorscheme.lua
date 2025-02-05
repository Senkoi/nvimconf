local colorscheme = "tokyodark"

local opts = {
	custom_highlights = function(highlights, palette)
		highlights.Visual = { fg = "#FFFFFF", bg = "#5A5A5A" }
		highlights.VisualNOS = { fg = "#FFFFFF", bg = "#5A5A5A" }
		highlights.CursorLine = { bg = "#2E2E2E" }
		return highlights
	end,

}


local function setup_tokyodark(opts)
	require("tokyodark").setup(opts)
	local is_ok, _ = pcall(vim.cmd, "colorscheme ".. colorscheme)
	if not is_ok then
		vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	end
end


setup_tokyodark(opts)
