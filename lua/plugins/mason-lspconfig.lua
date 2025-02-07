return {
 	"williamboman/mason-lspconfig.nvim",
     dependencies = {
         "williamboman/mason.nvim",
     },
     config = function()
         require("mason-lspconfig").setup()
         require("config.mason")
     end,
}
