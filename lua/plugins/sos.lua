return {
  -- auto saver
  "tmillr/sos.nvim",
  event = "InsertEnter",
  config = function()
    require("sos").setup({
      timeout = 30000,
      autowrite = true,
      save_on_cmd = "some",
      save_on_bufleave = true,
      save_on_focuslost = true,
    })
  end
}
