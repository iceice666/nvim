local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

npairs.setup({

  enable_check_bracket_line = false
})

npairs.add_rule(
  Rule("<", ">")
  :with_move(cond.none())
  :with_cr(cond.none())
)
