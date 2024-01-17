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

    local ft_km = {
      ["default"] = req("lsp.default"),
      ["rust"] = req("lsp.rust"),
    }

    require("which-key").register({
      ["<leader>l"] = {
        function()
          local km = ft_km[vim.bo.filetype]
          if km == nil then
            km = ft_km["default"]
          end

          km:activate()
        end,
        "[Hydra] Lsp binding",
      },
    })
  end,
}
