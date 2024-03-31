-- [ Telescope ]
return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    event = "VeryLazy",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("scope")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    config = function()
      local actions = require("telescope.actions")
      local previewers = require("telescope.previewers")
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["?"] = "which_key",
            },
            n = {},
          },
          buffer_previewer_maker = function(filepath, bufnr, opts)
            opts = opts or {}

            filepath = vim.fn.expand(filepath)
            vim.loop.fs_stat(filepath, function(_, stat)
              if not stat then
                return
              end
              if stat.size > 100000 then
                return
              else
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
              end
            end)
          end,
        },

        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(fp)
              local image_extensions = { "png", "jpg" } -- Supported image formats
              local split_path = vim.split(fp:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end

              vim.fn.jobstart({
                "catimg",
                filepath, -- Terminal image viewer command
              }, {
                on_stdout = send_output,
                stdout_buffered = true,
              })
            else
              require("telescope.previewers.utils").set_preview_message(
                bufnr,
                opts.winid,
                "Binary cannot be previewed"
              )
            end
          end,
        },
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
        },
        pickers = {
          oldfiles = {
            only_cwd = true,
          },
          find_files = {
            theme = "ivy",
          },
          git_files = {
            theme = "ivy",
          },
        },
      })

      telescope.load_extension("noice") -- noice always loaded earlier than telescope
    end,
  },
}
