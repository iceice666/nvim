local firstToUpper = require("core.utils").firstToUpper
local colors = require("core.colors")

local galaxyline = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = galaxyline.section
galaxyline.short_line_list = {
    "neo-tree",
    "dapui_breakpoints",
    "dapui_watches",
    "dapui_stacks",
    "dapui_scopes",
    "dap-repl",
    "lspsagaoutline",
}


local separator = function()
  return {
      Separator = {
          highlight = { colors.fg, colors.bg, 'bold' },
          provider = function()
            return ' '
          end,
      },
  }
end

-- Left
gls.left = {

    separator(),
    {

        VimMode = {
            icon = " ",
            provider = function()
              local modes = {
                  [110] = '  NORMAL',
                  [105] = '  INSERT',
                  [99]  = ' COMMAND',
                  [116] = 'TERMINAL',
                  [118] = '  VISUAL',
                  [22]  = ' V-BLOCK',
                  [86]  = '  V-LINE',
                  [82]  = ' REPLACE',
              }
              local mode = modes[vim.fn.mode():byte()]
              if mode ~= nil then
                return mode
              else
                return vim.fn.mode():byte()
              end
            end,
            highlight = { colors.fg, colors.bg }
        }
    },
    separator(),
    {
        DiagnosticError = {
            highlight = { colors.red, colors.bg },
            icon = '  ',
            provider = 'DiagnosticError',
        },
    },
    separator(),
    {
        DiagnosticWarn = {
            highlight = { colors.gold, colors.bg },
            icon = '  ',
            provider = 'DiagnosticWarn',
        },
    },
    separator(),
    {
        DiagnosticHint = {
            highlight = { colors.blue, colors.bg },
            icon = '  ',
            provider = 'DiagnosticHint',
        },
    },
    separator(),
    {
        DiagnosticInfo = {
            highlight = { colors.lightblue, colors.bg },
            icon = '  ',
            provider = 'DiagnosticInfo',
        },
    },
    -- {
    --   Cwd = {
    --     highlight = { colors.cyan, colors.bg },
    --     icon = '  ',
    --     provider = function()
    --       return vim.fn.getcwd() .. "/"
    --     end
    --   }
    -- },
    {
        FilePath = {
            icon = ' ',
            provider = 'FilePath',
            highlight = { colors.blue, colors.bg },
        }
    },
}
-- Mid
gls.mid = {
}
-- Right
gls.right = {
    {
        GitIcon = {
            provider = function()
              return ' '
            end,
            condition = condition.check_git_workspace,
            highlight = { colors.orange, colors.bg, 'bold' },
            separator = ' ',
            separator_highlight = { 'NONE', colors.bg },
        },
    },

    {
        GitBranch = {
            condition = condition.check_git_workspace,
            highlight = { colors.fg, colors.bg, 'bold' },
            provider = 'GitBranch',
        },
    },
    separator(),
    {
        DiffAdd = {
            condition = condition.hide_in_width,
            highlight = { colors.green, colors.bg },
            icon = '  ',
            provider = 'DiffAdd',
        },
    },

    {
        DiffModified = {
            condition = condition.hide_in_width,
            highlight = { colors.orange, colors.bg },
            icon = ' 柳',
            provider = 'DiffModified',
        },
    },

    {
        DiffRemove = {
            condition = condition.hide_in_width,
            highlight = { colors.red, colors.bg },
            icon = '  ',
            provider = 'DiffRemove',
        },
    },
    separator(),
    {
        ShowLspClient = {
            --[[ condition = function()
              local tbl = {
                  ['dashboard'] = true,
                  [''] = true
              }
              if tbl[vim.bo.filetype] then
                return false
              end
              return true
            end, ]]
            highlight = {
                colors.pink,
                colors.bg,
                'bold'
            },
            icon = ' LSP: ',
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
        LineInfo = {
            highlight = { colors.bluegreen, colors.bg },
            provider = 'LineColumn',
            separator = '',
            separator_highlight = { 'NONE', colors.bg },
        },
    },
    {
        PerCent = {
            highlight = { colors.bluegreen, colors.bg, 'bold' },
            provider = 'LinePercent',
        },
    },
    {
        FileIcon = {
            condition = condition.buffer_not_empty,
            highlight = {
                require('galaxyline.provider_fileinfo').get_file_icon_color,
                colors.bg
            },
            provider = 'FileIcon',
        },
    },
    {
        FileTypeName = {
            condition = condition.buffer_not_empty,
            highlight = {
                require('galaxyline.provider_fileinfo').get_file_icon_color,
                colors.bg,
                'bold'
            },
            provider = function()
              return firstToUpper(vim.bo.filetype)
            end,
        },
    },

    separator(),
}
gls.short_line_left = {
    separator(),

    {
        FileName = {
            highlight = { colors.fg, colors.bg, 'bold' },
            provider = 'FileName',
            separator = ' ',
            separator_highlight = { 'NONE', colors.bg },
        },
    },


}
gls.short_line_right = {
    {
        BufferIcon = {
            highlight = { colors.fg, colors.bg },
            provider = 'BufferIcon',
        },
    },
    separator()
}
