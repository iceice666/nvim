return {
  "onsails/lspkind-nvim",
  config = function()
    require("lspkind").init({
      symbol_map = {
        VariableMember = "󰜢",
        PunctuationSpecial = "󱔁",
        Number = "󰎠",
        Text = "󰉿",
        String = "󰀬",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Boolean = "",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "",
        KeywordFunction = "",
        KeywordCoroutine = "",
        KeywordOperator = "",
        KeywordConditional = "",
        KeywordReturn = "",
        Snippet = "󰅇",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "",
        TypeParameter = "",
        Type = "",
        Comment = "󰅺",

        FittenCode = ""
      },
    })
  end
}
