return {
  "kawre/neotab.nvim",
  event = "InsertEnter",
  opts = {
    pairs = {
      { open = "(", close = ")" },
      { open = "[", close = "]" },
      { open = "{", close = "}" },
      { open = "'", close = "'" },
      { open = "\"", close = "\"" },
      { open = "`", close = "`" },
      { open = "<", close = ">" },
    },
    tabkey = "",
    smart_punctuators = {
      enabled = true,
      semicolon = {
        enabled = true,
        ft = { "cs", "c", "cpp", "java", "rust" },
      },

      escape = {
        enabled = true,
        -- triggers = {
        --   [","] = {
        --     pairs = {
        --       { open = "'", close = "'" },
        --       { open = "\"", close = "\"" },
        --     },
        --     format = "%s ", -- ", "
        --   },
        -- },
      },
    },
  },
}
