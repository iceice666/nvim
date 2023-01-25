require("todo-comments").setup({
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = {
        "FIXME",
        "BUG",
        "FIXIT",
        "ISSUE"
      },
    },
    TODO = {
      icon = " ",
      color = "hint"
    },
    HACK = {
      icon = " ",
      color = "warning"
    },
    WARN = {
      icon = " ",
      color = "warning",
      alt = {
        "WARNING",
        "WARN",
        "XXX"
      }
    },
    PERF = {
      icon = " ",
      alt = {
        "OPTIM",
        "PERFORMANCE",
        "OPTIMIZE"
      }
    },
    NOTE = {
      icon = " ",
      color = "hint",
      alt = {
        "INFO"
      }
    },
    TEST = {
      icon = "⏲ ",
      color = "test",
      alt = {
        "TESTING",
        "PASSED",
        "FAILED"
      }
    },
  },
  colors = {
    error = { "#DC2626" },
    warning = { "#FBBF24" },
    info = { "#2563EB" },
    hint = { "#10B981" },
    default = { "#7C3AED" },
    test = { "#FF00FF" }
  },
})