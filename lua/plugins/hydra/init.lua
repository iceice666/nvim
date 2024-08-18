return {
  {
    cond = 1 ~= vim.g.vscode,
    "nvimtools/hydra.nvim",
    event = "VeryLazy",
    config = function()
      local utils = vim.g.utils

      local function require_hydra(text)
        return require("plugins.hydra.components." .. text)
      end
      -- register components after vim loaded
      local hydra_tabpage = require_hydra("tabpage")
      local hydra_telescope = require_hydra("telescope")
      local hydra_winctrl = require_hydra("winctrl")
      local hydra_buffer = require_hydra("buffer")
      -- require_hydra("for_fun")

      require("which-key").add(
        {
          icon = "󰈚",
          group = "hydra",
          nowait = true,
          {
            "<leader>l",
            function()
              if utils.is_file_exist("Cargo.toml") or utils.is_lsp_active("rust-analyzer") then
                require_hydra("lsp.rust"):activate()
              elseif utils.is_file_exist("pubspec.yaml") or utils.is_lsp_active("dartls") then
                require_hydra("lsp.flutter"):activate()
              else
                require_hydra("lsp.default"):activate()
              end
            end,
            desc = "[Hydra] Lsp binding",
          },
          {
            "<c-t>",
            function()
              hydra_tabpage:activate()
            end,
            desc = "[Hydra] Tabpage"
          },
          {
            "<leader>b",
            function()
              hydra_buffer:activate()
            end,
            desc = "[Hydra] Buffer"
          },
          {
            "<leader>t",
            function()
              hydra_telescope:activate()
            end,
            desc = "[Hydra] Telescope"
          },
          {
            "<c-w>",
            function()
              hydra_winctrl:activate()
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
