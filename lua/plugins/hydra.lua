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

    local lsp_default = req("lsp.default")
    local lsp_rust = req("lsp.rust")

    require("which-key").register({
      ["<leader>l"] = {
        function()
          if vim.bo.filetype == "rust" then
            lsp_rust:activate()
          else
            lsp_default:activate()
          end
        end,
        "[Hydra] Lsp binding",
      },
    })
  end,
}
