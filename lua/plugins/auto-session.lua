return {
  -- Sessions
  cond = true,
  "rmagatti/auto-session",
  keys = { "<leader>R", "<cmd>SessionRestore<cr>", desc = "Restore Session" },
  cmd = {
    "SessionRestore",
    "SessionSave",
  },
  opts = {
    log_level = "error",
    auto_session_suppress_dirs = {
      "~/",
      "~/Desktop",
      "~/Downloads",
      "/",
      "/ect",
      "/usr",
    },
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = false,
    auto_save_enabled = nil,
    auto_restore_enabled = false,
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = nil,
  },
}
