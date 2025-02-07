local lspconf = require('config.lsp')
require("mason-lspconfig").setup_handlers {
    -- 这个匿名函数就是默认处理器
    function (server_name)
        require("lspconfig")[server_name].setup {
            on_attach = lspconf.custom_attach,
        }
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

            on_attach = lspconf.custom_attach,
            -- 可选：在 on_attach 中设置一些快捷键或自定义操作
            -- on_attach = function(client, bufnr)
            --     -- 例如：启用自动格式化、绑定快捷键等
            --     -- 这里仅作为示例，可根据需要自定义
            --     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            --     local opts = { noremap = true, silent = true }
            --     buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            -- end,

            -- 可选：配置 capabilities 以支持补全等功能
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                FormattingOptions = {
                -- Enables support for reading code style, naming convention and analyzer
                -- settings from .editorconfig.
                EnableEditorConfigSupport = true,
                -- Specifies whether 'using' directives should be grouped and sorted during
                -- document formatting.
                OrganizeImports = nil,
                },
                omnisharp = {
                  enableRoslynAnalyzers = true,  -- 启用 Roslyn 分析器
                  organizeImportsOnFormat = true, -- 格式化时整理导入
                  enableEditorConfigSupport = true, -- 启用 EditorConfig 支持
                },
                MsBuild = {
                  -- If true, MSBuild project system will only load projects for files that
                  -- were opened in the editor. This setting is useful for big C# codebases
                  -- and allows for faster initialization of code navigation features only
                  -- for projects that are relevant to code that is being edited. With this
                  -- setting enabled OmniSharp may load fewer projects and may thus display
                  -- incomplete reference lists for symbols.
                  LoadProjectsOnDemand = nil,
                },
                RoslynExtensionsOptions = {
                  -- Enables support for roslyn analyzers, code fixes and rulesets.
                  EnableAnalyzersSupport = true,
                  -- Enables support for showing unimported types and unimported extension
                  -- methods in completion lists. When committed, the appropriate using
                  -- directive will be added at the top of the current file. This option can
                  -- have a negative impact on initial completion responsiveness,
                  -- particularly for the first few completion sessions after opening a
                  -- solution.
                  EnableImportCompletion = true,
                  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                  -- true
                  AnalyzeOpenDocumentsOnly = nil,
                },
                Sdk = {
                  -- Specifies whether to include preview versions of the .NET SDK when
                  -- determining which version to use for project loading.
                  IncludePrereleases = true,
                },
           },
        }
    end,
}
