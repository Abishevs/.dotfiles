return {
    "vimwiki/vimwiki",
    lazy = false,
init = function()
        vim.g.vimwiki_list = {
            {
                path = "~/dev/vimwiki/school/",
                syntax = "default",
                ext = ".wiki"
            },
            {
                path = "~/dev/vimwiki/work/",
                syntax = "default",
                ext = ".wiki"
            },
            {
                path = "~/dev/vimwiki/personal/",
                syntax = "default",
                ext = ".wiki"
            },
        }
        vim.g.vimwiki_global_ext = 0  -- Prevent conflicts with markdown files
	vim.g.vimwiki_listsyms = "❌⭕🟠🟡✅"
    end
}


