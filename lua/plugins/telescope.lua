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
      n = {
      },
    },
    buffer_previewer_maker = function(filepath, bufnr, opts)
      opts = opts or {}

      filepath = vim.fn.expand(filepath)
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 100000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end
  },
  preview = {
    mime_hook = function(filepath, bufnr, opts)
      local is_image = function(fp)
        local image_extensions = { 'png', 'jpg' } -- Supported image formats
        local split_path = vim.split(fp:lower(), '.', { plain = true })
        local extension = split_path[#split_path]
        return vim.tbl_contains(image_extensions, extension)
      end
      if is_image(filepath) then
        local term = vim.api.nvim_open_term(bufnr, {})
        local function send_output(_, data, _)
          for _, d in ipairs(data) do
            vim.api.nvim_chan_send(term, d .. '\r\n')
          end
        end

        vim.fn.jobstart(
          {
            'catimg', filepath -- Terminal image viewer command
          },
          { on_stdout = send_output, stdout_buffered = true })
      else
        require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
      end
    end
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      --hidden = true,
      grouped = true,
      depth = 2
    },
    workspaces = {
      keep_insert = true,
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
  pickers = {
    oldfiles = {
      only_cwd = true
    }
  },
})
--telescope.load_extension('dap')
telescope.load_extension('fzf')
telescope.load_extension("live_grep_args")
telescope.load_extension("file_browser")
telescope.load_extension("noice")
telescope.load_extension("workspaces")
telescope.load_extension('neoclip')

local mapx = require("core.keymap").mapx

mapx.nname("<leader>t", "Telescope")
mapx.nname("<leader>tf", "Telescope: Find")
mapx.group({ silent = true }, function()
  mapx.nnoremap("<leader>tff",
    "<cmd>Telescope find_files<cr>",
    "Telescope: Find files")

  mapx.nnoremap("<leader>tfS",
    "<cmd>Telescope grep_string<cr>",
    "Telescope: Find files that contain the current cursor word")

  mapx.nnoremap("<leader>tfb",
    "<cmd>Telescope file_browser<cr>",
    "Telescope: File browser")

  mapx.nnoremap("<leader>tfs",
    "<cmd>Telescope live_grep_args<cr>",
    "Telescope: Find words")

  mapx.nnoremap("<leader>tr",
    "<cmd>Telescope oldfiles<cr>",
    "Telescope: Recent files")

  mapx.nnoremap("<leader>tw",
    "<cmd>Telescope workspaces<cr>",
    "Telescope: Show workspaces")

  mapx.nnoremap("<leader>ty",
    "<cmd>Telescope neoclip<cr>",
    "Telescope: Yank history")

  mapx.nnoremap("<leader>tm",
    "<cmd>lua require('telescope').extensions.macroscope.default()<cr>",
    "Telescope: Macros history")

  mapx.nnoremap("<leader>th",
    "<cmd> Telescope highlights<cr>",
    "Telescope: highlights")
end)
