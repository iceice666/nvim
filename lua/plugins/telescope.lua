-- [ Telescope ]
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      -- TODO: usage
      "ecthelionvi/NeoComposer.nvim",
      dependencies = "kkharji/sqlite.lua",
      config = function()
        require("NeoComposer").setup({
          keymaps = {
            play_macro = "Q",
            yank_macro = "yq",
            stop_macro = "cq",
            toggle_record = "q",
            cycle_next = "<c-n>",
            cycle_prev = "<c-p>",
            toggle_macro_menu = "<c-q>",
          },
        })
      end,
    },
  },
  cmd = "Telescope",
  keys = "<leader>t",
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
            }, { on_stdout = send_output, stdout_buffered = true })
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
        workspaces = {
          keep_insert = true,
        },
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
    --telescope.load_extension('dap')
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("noice")
    telescope.load_extension("workspaces")
    telescope.load_extension("macros")

    local mapx = vim.g.mapx

    mapx.group({ silent = true }, function()
      mapx.nnoremap(
        "<leader>tff",
        "<cmd>Telescope find_files<cr>",
        "Telescope: Find files"
      )

      mapx.nnoremap(
        "<leader>tfg",
        "<cmd>Telescope git_files<cr>",
        "Telescope: Find git tracked files"
      )

      mapx.nnoremap(
        "<leader>tfc",
        "<cmd>Telescope grep_string<cr>",
        "Telescope: Find files that contain the current cursor word"
      )

      mapx.nnoremap(
        "<leader>tfs",
        "<cmd>Telescope live_grep_args<cr>",
        "Telescope: Find words"
      )

      mapx.nnoremap(
        "<leader>tr",
        "<cmd>Telescope oldfiles<cr>",
        "Telescope: Recent files"
      )

      mapx.nnoremap(
        "<leader>tw",
        "<cmd>Telescope workspaces<cr>",
        "Telescope: Show workspaces"
      )

      mapx.nnoremap(
        "<leader>ty",
        "<cmd>Telescope neoclip<cr>",
        "Telescope: Yank history"
      )

      mapx.nnoremap(
        "<leader>tm",
        "<cmd>Telescope macros<cr>",
        "Telescope: Macros history"
      )

      mapx.nnoremap(
        "<leader>th",
        "<cmd> Telescope highlights<cr>",
        "Telescope: highlights"
      )
    end)
  end,
}
