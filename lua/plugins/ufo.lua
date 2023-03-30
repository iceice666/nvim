return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local mapx = vim.g.mapx
    mapx.group({}, function()
      mapx.nnoremap(
        "<leader>fO",
        require("ufo").openAllFolds,
        "UFO: open all folds"
      )
      mapx.nnoremap(
        "<leader>fC",
        require("ufo").closeAllFolds,
        "UFO: close all folds"
      )
      mapx.nnoremap("<leader>fo", require("ufo").openFoldsExceptKinds)
      mapx.nnoremap("<leader>fc", require("ufo").closeFoldsWith)
      mapx.nnoremap("<leader>fp", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if winid then
          local bufnr = vim.api.nvim_win_get_buf(winid)
          mapx.group({ buffer = bufnr }, function()
            local keys = { "a", "i", "o", "A", "I", "O", "gd", "gr" }
            for _, k in ipairs(keys) do
              mapx.nnoremap(k, "<cr>" .. k)
            end
          end)
        else
          vim.lsp.buf.hover()
        end
      end, "UFO: Peek fold")
    end)

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = function(
        virtText,
        lnum,
        endLnum,
        width,
        truncate
      )
        local newVirtText = {}
        local suffix = ("  %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
    })
  end,
}
