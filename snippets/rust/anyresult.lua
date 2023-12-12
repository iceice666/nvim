return {
  s({
    trig = "anyr",
    condition = function()
      local ignored_nodes = { "string", "comment" }

      local pos = vim.api.nvim_win_get_cursor(0)

      local row, col = pos[1] - 1, pos[2] - 1
      local node_type = vim.treesitter
        .get_node({
          pos = { row, col },
        })
        :type()

      return not vim.tbl_contains(ignored_nodes, node_type)
    end,
  }, t("type AnyResult<T = ()> = anyhow::Result<T>;")),
}
