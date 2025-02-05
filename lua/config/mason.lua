require("mason-lspconfig").setup_handlers {
    -- 这个匿名函数就是默认处理器
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
    -- 针对 rust_analyzer 单独定制处理器
    --["rust_analyzer"] = function ()
    --    require("rust-tools").setup {}
    ["omnisharp"] = function ()
        require("lspconfig").omnisharp.setup {
            -- 启动命令，根据你的 omnisharp 安装位置和版本可能需要调整
            cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
            
            -- 设置项目根目录的检测方式
            root_dir = function(fname)
                -- 这里尝试从当前文件开始向上查找 .git 目录，
                -- 如果没有找到则使用当前工作目录作为根目录
                return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
            end,

            -- 可选：在 on_attach 中设置一些快捷键或自定义操作
            on_attach = function(client, bufnr)
                -- 例如：启用自动格式化、绑定快捷键等
                -- 这里仅作为示例，可根据需要自定义
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local opts = { noremap = true, silent = true }
                buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            end,

            -- 可选：配置 capabilities 以支持补全等功能
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end,
}
