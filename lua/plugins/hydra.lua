return {
  "anuvyklack/hydra.nvim",
  lazy = false,
  config = function()
    local req = function(text)
      return require("plugins.hydra." .. text)
    end

    req("telescope")
  end,
}
