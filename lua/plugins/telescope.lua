local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
require("telescope").setup({
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
      local is_image = function(filepath)
        local image_extensions = { 'png', 'jpg' } -- Supported image formats
        local split_path = vim.split(filepath:lower(), '.', { plain = true })
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
  },
  pickers = {
    oldfiles = {
      only_cwd = true
    }
  },

})
--require('telescope').load_extension('dap')
require('telescope').load_extension('fzf')
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("noice")

local mapx = require("core.keymap").mapx

mapx.nname("<leader>t", "Telescope")
mapx.group({ silent = true }, function()
  mapx.nnoremap("<leader>tff", "<cmd>Telescope find_files<cr>")
  mapx.nnoremap("<leader>tfs", "<cmd>Telescope grep_string<cr>")
  mapx.nnoremap("<leader>tfb", "<cmd>Telescope file_browser<cr>")
  mapx.nnoremap("<leader>tF", "<cmd>Telescope live_grep_args<cr>")
  mapx.nnoremap("<leader>tr", "<cmd>Telescope oldfiles<cr>")
  mapx.nnoremap("<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>")
  mapx.nnoremap("<leader>sD", "<cmd>Telescope diagnostics<cr>")
end)
