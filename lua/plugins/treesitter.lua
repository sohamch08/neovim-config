return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup({})

        ts.install({
            "bash",
            "c",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "regex",
            "gitignore",
            "toml",
            "json",
            "yaml",
            "make",
            "cmake",
            "python",
            "css",
            "latex",
            "bibtex",
            "git_config",
            "gitcommit",
            "rasi",
            "typst",
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup(
                "TreesitterSetup",
                { clear = true }
            ),
            callback = function(args)
                -- Keep normal syntax if no parser is installed.
                if not pcall(vim.treesitter.start, args.buf) then
                    return
                end

                if vim.bo[args.buf].filetype ~= "ruby" then
                    vim.bo[args.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                else
                    vim.bo[args.buf].syntax = "ruby"
                end
            end,
        })
    end,
}
