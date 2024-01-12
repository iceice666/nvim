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
  end,
}
