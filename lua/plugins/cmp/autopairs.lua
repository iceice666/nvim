return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    local rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.setup({
      enable_check_bracket_line = false,
    })

    npairs.add_rule(rule("<", ">"):with_move(cond.none()):with_cr(cond.none()))
  end,
}
