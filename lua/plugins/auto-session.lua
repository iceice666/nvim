return {
  -- Sessions
  cond = true,
  "rmagatti/auto-session",
  keys = "<leader>R",
  cmd = {
    "SessionRestore",
    "SessionSave",
  },
  config = function()
    require("auto-session").setup({
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
    })
    vim.o.sessionoptions =
    "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    vim.g.mapx.nnoremap(
      "<leader>R",
      "<cmd>RestoreSession<cr>",
      "Restore Session"
    )
  end,
}
