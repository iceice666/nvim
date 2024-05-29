return {
  {
    "nvimtools/hydra.nvim",
    lazy = false,
    config = function()
      -- register components after vim loaded
      vim.g.utils.require_hydra("tabpage")
      vim.g.utils.require_hydra("telescope")
      vim.g.utils.require_hydra("winctrl")
      -- vim.g.utils.require_hydra("for_fun")
      vim.g.utils.require_hydra("buffer")
    end,
    keys = {
      {
        "<leader>l",
        function()
          local km = vim.g.utils.require_hydra("lsp.default")

          if vim.g.utils.is_file_exist("Cargo.toml") or vim.g.utils.is_lsp_active("rust_analyzer") then
            km = vim.g.utils.require_hydra("lsp.rust")
          elseif vim.g.utils.is_file_exist("pubspec.yaml") or vim.g.utils.is_lsp_active("dartls") then
            km = vim.g.utils.require_hydra("lsp.flutter")
          end

          km:activate()
        end,
        desc = "[Hydra] Lsp binding",
      },
    }

  },
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    lazy = true
  },
  {
    "sindrets/winshift.nvim",
    event = "VeryLazy",
    lazy = true,

  },
  {
    "anuvyklack/windows.nvim",
    lazy = true,
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = true,
  }
}
