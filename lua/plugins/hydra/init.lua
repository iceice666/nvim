return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",
  dependencies = {
    "mrjones2014/smart-splits.nvim",
    "sindrets/winshift.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
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
      return require("plugins.hydra.components." .. text)
    end

    local is_lsp_active = function(lsp_name)
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == lsp_name then
          return true
        end
      end
      print("false!")

      return false
    end

    req("tabpage")
    req("telescope")
    req("winctrl")
    req("buffer")

    local is_file_exist = function(path)
      return vim.fn.filereadable(vim.fn.getcwd() .. "/" .. path) == 1
    end

    require("which-key").register({
      ["<leader>l"] = {
        function()
          local km = req("lsp.default")

          if is_file_exist("Cargo.toml") or is_lsp_active("rust_analyzer") then
            km = req("lsp.rust")
          elseif is_file_exist("pubspec.yaml") or is_lsp_active("dartls") then
            km = req("lsp.flutter")
          end

          km:activate()
        end,
        "[Hydra] Lsp binding",
      },
    })
  end,
}
