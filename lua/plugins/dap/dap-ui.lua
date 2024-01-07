return {
  "rcarriga/nvim-dap-ui",
  opts = {
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.5,
          },
          {
            id = "stacks",
            size = 0.1,
          },
          {
            id = "watches",
            size = 0.3,
          },
          {
            id = "breakpoints",
            size = 0.1,
          },
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 10,
        position = "bottom",
      },
    },
    controls = {
      enabled = false,
    },
  },
}
