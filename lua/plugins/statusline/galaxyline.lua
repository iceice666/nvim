return {
  -- Status line
  "glepnir/galaxyline.nvim",
  event = "BufReadPre",
  config = function()
    local firstToUpper = vim.g.util.firstToUpper
    local colors = vim.g.colors
    local fileinfo = require("galaxyline.provider_fileinfo")
    local galaxyline = require("galaxyline")
    local condition = require("galaxyline.condition")
    local gls = galaxyline.section
    galaxyline.short_line_list = {
      "neo-tree",
      "dapui_breakpoints",
      "dapui_watches",
      "dapui_stacks",
      "dapui_scopes",
      "dapui_console",
      "dap-repl",
    }
    local separator = function()
      return {
        Separator = {
          highlight = { colors.fg, colors.bg },
          provider = function()
            return " "
          end,
        },
      }
    end

    local modes_texts = {
      [110] = "NORMAL  ",
      [105] = "INSERT  ",
      [99] = "COMMAND ",
      [116] = "TERMINAL",
      [118] = "VISUAL  ",
      [22] = "V-BLOCK ",
      [86] = "V-LINE  ",
      [82] = "REPLACE ",
    }

    local filetype_names = {
      ["dapui_stacks"] = "DAP Stacks",
      ["dapui_scopes"] = "DAP Scopes",
      ["dapui_watches"] = "DAP Watches",
      ["dapui_breakpoints"] = "DAP Breakpoints",
      ["dapui_console"] = "DAP Console",
      ["dap-repl"] = "DAP Repl",
    }

    -- Left
    gls.left = {
      separator(),
      {
        VimMode = {
          condition = condition.buffer_not_empty,
          icon = " ",
          provider = function()
            local mode = modes_texts[vim.fn.mode():byte()]
            if mode ~= nil then
              return mode
            else
              return vim.fn.mode():byte()
            end
          end,
          highlight = { colors.fg, colors.bg },
        },
      },
      separator(),
      {
        DiagnosticError = {
          highlight = { colors.error, colors.bg },
          icon = "  ",
          provider = "DiagnosticError",
        },
      },
      {
        DiagnosticWarn = {
          highlight = { colors.warning, colors.bg },
          icon = "  ",
          provider = "DiagnosticWarn",
        },
      },
      {
        DiagnosticHint = {
          highlight = { colors.hint, colors.bg },
          icon = "  ",
          provider = "DiagnosticHint",
        },
      },
      {
        DiagnosticInfo = {
          highlight = { colors.info, colors.bg },
          icon = "  ",
          provider = "DiagnosticInfo",
        },
      },
      separator(),
      {
        FilePath = {
          icon = " ",
          provider = "FilePath",
          highlight = { colors.teal, colors.bg },
        },
      },
    }
    -- Mid
    gls.mid = {}
    -- Right
    gls.right = {
      {
        GitIcon = {
          icon = " ",
          condition = condition.check_git_workspace,
          highlight = { colors.orange, colors.bg, "bold" },
          separator = " ",
          separator_highlight = { "NONE", colors.bg },
          provider = "GitBranch",
        },
      },
      separator(),
      {
        DiffAdd = {
          condition = condition.hide_in_width,
          highlight = { colors.green, colors.bg },
          icon = "  ",
          provider = "DiffAdd",
        },
      },

      {
        DiffModified = {
          condition = condition.hide_in_width,
          highlight = { colors.orange, colors.bg },
          icon = " 柳",
          provider = "DiffModified",
        },
      },

      {
        DiffRemove = {
          condition = condition.hide_in_width,
          highlight = { colors.red, colors.bg },
          icon = "  ",
          provider = "DiffRemove",
        },
      },
      separator(),
      {
        LspClient = {
          condition = function()
            local tbl = {
              ["dashboard"] = true,
              [""] = true,
            }
            if tbl[vim.bo.filetype] then
              return false
            end
            return true
          end,
          highlight = {
            colors.red,
            colors.bg,
            "bold",
          },
          icon = "  LSP: ",
          provider = function()
            local clients = vim.lsp.get_active_clients()
            local s = {}
            for _, v in pairs(clients) do
              if v.name ~= "null-ls" then
                s[#s + 1] = v.name
              end
            end
            return table.concat(s, ", ")
          end,
        },
      },
      separator(),
      {
        NullLsClient = {
          condition = function()
            local tbl = {
              ["dashboard"] = true,
              [""] = true,
            }
            if tbl[vim.bo.filetype] then
              return false
            end
            return true
          end,
          highlight = {
            colors.red,
            colors.bg,
            "bold",
          },
          icon = "  null-ls: ",
          provider = function()
            local sources = require("null-ls").get_sources()
            local s = {}
            local ft = vim.bo.filetype
            for _, v in pairs(sources) do
              if v.filetypes[ft] == true then
                s[#s + 1] = v.name
              end
            end
            return table.concat(s, ", ")
          end,
        },
      },
      separator(),
      {
        Lines = {
          highlight = { colors.green2, colors.bg },
          icon = "Lines ",
          provider = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")
            return current_line
              .. "/"
              .. total_lines
              .. " ("
              .. math.floor(current_line * 100 / total_lines)
              .. "%)"
          end,
          separator = "",
          separator_highlight = { "NONE", colors.bg },
        },
      },
      separator(),
      {
        FileIcon = {
          condition = condition.buffer_not_empty,
          highlight = {
            require("galaxyline.provider_fileinfo").get_file_icon_color,
            colors.bg,
          },
          provider = "FileIcon",
        },
      },
      {
        FileTypeName = {
          condition = condition.buffer_not_empty,
          highlight = {
            require("galaxyline.provider_fileinfo").get_file_icon_color,
            colors.bg,
            "bold",
          },
          provider = function()
            local ft = vim.bo.filetype
            local exclude = { "css", "scss", "html" }
            for _, v in pairs(exclude) do
              if ft == v then
                return string.upper(ft)
              end
            end
            return firstToUpper(ft)
          end,
        },
      },
      separator(),
    }

    gls.short_line_left = {
      separator(),
      {
        BufferName = {
          icon = " ",
          provider = function()
            local name = filetype_names[vim.bo.filetype]
            if name ~= nil then
              return name
            else
              return fileinfo.get_current_file_path()
            end
          end,
          highlight = { colors.lime, colors.bg },
        },
      },
    }
    gls.short_line_right = {
      {
        BufferIcon = {
          highlight = { colors.fg, colors.bg },
          provider = "BufferIcon",
        },
      },
      separator(),
    }
  end,
}
