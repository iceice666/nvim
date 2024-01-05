return {
  -- auto saver
  enabled = false,
  "tmillr/sos.nvim",
  event = "BufReadPost",
  opts = {
    timeout = 30000,
    autowrite = true,
    save_on_cmd = "some",
    save_on_bufleave = true,
    save_on_focuslost = true,
  },
}
