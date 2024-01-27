local ftMap = {
  vim = "indent",
  python = { "indent" },
  git = "",
}

local function customizeSelector(bufnr)
  local function handleFallbackException(err, providerName)
    if type(err) == "string" and err:match("UfoFallbackException") then
      return require("ufo").getFolds(bufnr, providerName)
    else
      return require("promise").reject(err)
    end
  end

  return require("ufo")
    .getFolds(bufnr, "lsp")
    :catch(function(err)
      return handleFallbackException(err, "treesitter")
    end)
    :catch(function(err)
      return handleFallbackException(err, "indent")
    end)
end

local provider_selector = function(bufnr, filetype, buftype)
  return ftMap[filetype] or customizeSelector
end

-- local handler = function(virtText, lnum, endLnum, width, truncate)
--   local newVirtText = {}
--   local suffix = (" 󰁂 %d lines"):format(endLnum - lnum)
--   local sufWidth = vim.fn.strdisplaywidth(suffix)
--   local targetWidth = width - sufWidth
--   local curWidth = 0
--   for _, chunk in ipairs(virtText) do
--     local chunkText = chunk[1]
--     print(chunkText)
--     local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--     if targetWidth > curWidth + chunkWidth then
--       table.insert(newVirtText, chunk)
--     else
--       chunkText = truncate(chunkText, targetWidth - curWidth)
--       local hlGroup = chunk[2]
--       table.insert(newVirtText, { chunkText, hlGroup })
--       chunkWidth = vim.fn.strdisplaywidth(chunkText)
--       -- str width returned from truncate() may less than 2nd argument, need padding
--       if curWidth + chunkWidth < targetWidth then
--         suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
--       end
--       break
--     end
--     curWidth = curWidth + chunkWidth
--   end
--   table.insert(newVirtText, { suffix, "MoreMsg" })
--   return newVirtText
-- end
--

local import_check = function(text, ft)
  return (ft == "rust" and text == "use")
    or ((ft == "cpp" or ft == "c") and text == "#include")
    or (ft == "python" and (text == "import" or text == "from"))
end

local handler = function(virtText, lnum, endLnum, _, _)
  local filetype = vim.bo.filetype
  local first_chunk = virtText[1]

  if import_check(first_chunk[1], filetype) then
    return {
      first_chunk,
      { " ", "Normal" },
      { "⋯ ", "Cursor" },
    }
  end

  local suffix = (" 󰁂 %d lines"):format(endLnum - lnum) .. " "
  table.insert(virtText, { suffix, "MoreMsg" })

  return virtText
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "VeryLazy",
  opts = {
    close_fold_kinds = { "imports", "comment" },
    preview = {
      win_config = {
        winblend = 0,
        maxheight = 50,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
    provider_selector = provider_selector,
    fold_virt_text_handler = handler,
  },
  keys = {
    {
      "zp",
      function()
        require("ufo").peekFoldedLinesUnderCursor()
      end,
      desc = "Peek fold",
    },
  },
}
