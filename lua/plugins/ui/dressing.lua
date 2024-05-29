return {
  'stevearc/dressing.nvim',
  lazy = false,
  opts = {
    input = {
      override = function(conf)
        conf.col = -1
        conf.row = 0
        return conf
      end,
    },
  },
}
