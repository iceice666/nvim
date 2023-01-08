require("alternate-toggler").setup({
  alternates = {
    ["true"] = "false",
    ["True"] = "False",
    ["TRUE"] = "FALSE",
    ["Yes"] = "No",
    ["YES"] = "NO",
    ["<"] = ">",
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ['"'] = "'",
    ['""'] = "''",
    ["==="] = "!==",
    ["!="] = "==",
  },
})
