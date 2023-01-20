local colors = {}

colors.fg = function()
  return '#ffffff'
end

colors.bg = function()
  return '#252526'
end

colors.green = function()
  return '#619955'

end

colors.bluegreen = function()
  return '#4ec9b0'

end

colors.yellow = function()
  return '#ffaf00'
end

colors.purple = function()
  return '#af00db'
end

colors.pink = function()
  return '#ff7ab2'
end

colors.yelloworrange = function()
  return '#d7ba7d'
end

colors.blue = function()
  return '#0a7aca'
end

colors.red = function()
  return '#f44747'
end

colors.lightblue = function()
  return '#5CB6F8'
end

colors.orange = function()
  return '#f15000'
end

local galaxyline = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = galaxyline.section
galaxyline.short_line_list = {}


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
      provider = function()
        local modes = {
          [110] = 'NORMAL  ',
          [105] = 'INSERT  ',
          [99]  = 'COMMAND ',
          [116] = 'TERMINAL',
          [118] = 'VISUAL  ',
          [22]  = 'V-BLOCK ',
          [86]  = 'V-LINE  ',
          [82]  = 'REPLACE ',
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
    ShowLspClient = {
      condition = function()
        local tbl = {
          ['dashboard'] = true,
          [''] = true
        }
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      highlight = {
        colors.pink,
        colors.bg,
        'bold'
      },
      icon = ' LSP:',
      provider = 'GetLspClient',
    },
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
      highlight = { colors.yellow, colors.bg },
      icon = '  ',
      provider = 'DiagnosticWarn',
    },
  },
  separator(),
  {
    DiagnosticHint = {
      highlight = { colors.cyan, colors.bg },
      icon = '  ',
      provider = 'DiagnosticHint',
    },
  },
  separator(),
  {
    DiagnosticInfo = {
      highlight = { colors.blue, colors.bg },
      icon = '  ',
      provider = 'DiagnosticInfo',
    },
  },
  {
    GitIcon = {
      provider = function()
        return ' '
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
      highlight = { colors.violet, colors.bg, 'bold' },
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
  }





}
-- Mid
gls.mid = {




}
-- Right
gls.right = {
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
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
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
        return vim.bo.filetype
      end,
    },
  },

  separator(),
}
