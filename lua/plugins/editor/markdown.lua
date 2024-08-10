return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_auto_close = 0

      vim.cmd([[
        function OpenMarkdownPreview (url)

        if has("win32")
        call system(['powershell.exe','start' , a:url])
        elseif has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
        "Mac options here

        elseif s:uname == "Linux\n"
        execute "silent ! firefox --new-window " . a:url
        endif
        endif
        endfunction

        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]])
    end,
    ft = { "markdown" },
  },
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,      -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("markview").setup({
        modes = { "n", "no", "c" }, -- Change these modes
        -- to what you need

        hybrid_modes = { "n" }, -- Uses this feature on
        -- normal mode

        -- This is nice to have
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].conecalcursor = "c";
          end
        }
      })
    end
  }
}
