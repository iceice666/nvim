return {
  "anuvyklack/hydra.nvim",
  lazy = false,
  dependencies = {
    "mrjones2014/smart-splits.nvim",
    "sindrets/winshift.nvim",
    {
      "anuvyklack/windows.nvim",
      dependencies = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim",
      },
      config = true,
    },
  },
  config = function()
    local req = function(text)
      return require("plugins.hydra." .. text)
    end

    req("telescope")
    req("winctrl")
    req("buffer")

    local expand = function(path)
      return vim.fn.getcwd() .. "/" .. vim.fn.expand(path)
    end

    require("which-key").register({
      ["<leader>l"] = {
        function()
          local km = req("lsp.default")
          if vim.fn.filereadable(expand("Cargo.toml")) then
            km = req("lsp.rust")
          elseif vim.fn.filereadable(expand("pubspec.yaml")) then
            km = req("lsp.flutter")
          end

          km:activate()
        end,
        "[Hydra] Lsp binding",
      },
    })
  end,
}
