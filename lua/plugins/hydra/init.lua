return {
  {
    cond = 1 ~= vim.g.vscode,
    "nvimtools/hydra.nvim",
    event = "VeryLazy",
    config = function()
      -- register components after vim loaded
      vim.g.utils.require_hydra("tabpage")
      vim.g.utils.require_hydra("telescope")
      vim.g.utils.require_hydra("winctrl")
      -- vim.g.utils.require_hydra("for_fun")
      vim.g.utils.require_hydra("buffer")

      require("which-key").add(
        {
          icon = "󰈚",
          group = "hydra",
          {
            "<leader>l",
            function()
              if vim.g.utils.is_file_exist("Cargo.toml") or vim.g.utils.is_lsp_active("rust-analyzer") then
                vim.g.utils.require_hydra("lsp.rust"):activate()
              elseif vim.g.utils.is_file_exist("pubspec.yaml") or vim.g.utils.is_lsp_active("dartls") then
                vim.g.utils.require_hydra("lsp.flutter"):activate()
              else
                vim.g.utils.require_hydra("lsp.default"):activate()
              end
            end,
            desc = "[Hydra] Lsp binding",
          },
          {
            "<c-t>",
            function()
              vim.g.utils.require_hydra("tabpage"):activate()
            end,
            desc = "[Hydra] Tabpage"
          },
          {
            "<leader>b",
            function()
              vim.g.utils.require_hydra("buffer"):activate()
            end,
            desc = "[Hydra] Buffer"
          },
          {
            "<leader>t",
            function()
              vim.g.utils.require_hydra("telescope"):activate()
            end,
            desc = "[Hydra] Telescope"
          },
          {
            "<c-w>",
            function()
              vim.g.utils.require_hydra("winctrl"):activate()
            end,
            desc = "[Hydra] Window control"
          }
        }
      )
    end,
  },
  {
    cond = 1 ~= vim.g.vscode,
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
  },
  {
    cond = 1 ~= vim.g.vscode,
    "sindrets/winshift.nvim",
    cmd = "WinShift"
  },
  {
    cond = 1 ~= vim.g.vscode,
    cmd = { "WindowsEqualize", "WindowsMaximize" },
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = true,
  } }
