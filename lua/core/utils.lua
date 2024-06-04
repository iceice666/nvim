M = {}

function M.set_keymap(km)
  for _, binding in ipairs(km) do
    local lhs = binding[1]
    local rhs = binding[2]

    local mode = binding.mode or "n"
    local desc = binding.desc or ""
    local expr = binding.expr or false



    if type(mode) == "table" then
      for _, m in ipairs(mode) do
        vim.keymap.set(m, lhs, rhs, { expr = expr, desc = desc, noremap = true, silent = true })
      end
    else
      vim.keymap.set(mode, lhs, rhs, { expr = expr, desc = desc, noremap = true, silent = true })
    end
  end
end

function M.require_hydra(text)
  return require("plugins.hydra.components." .. text)
end

function M.is_lsp_active(lsp_name)
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    if client.name == lsp_name then
      return true
    end
  end
  return false
end

function M.is_file_exist(path)
  return vim.fn.filereadable(vim.fn.getcwd() .. "/" .. path) == 1
end

function M.flatten(i, s, p, r)
  local function flatten(input_table, sep, prefix, result)
    prefix = prefix or ""
    result = result or {}
    sep = sep or "."

    for key, value in pairs(input_table) do
      local new_key = prefix ~= "" and (prefix .. sep .. key) or key

      if type(value) == "table" then
        flatten(value, sep, new_key, result)
      else
        result[new_key] = value
      end
    end

    return result
  end

  return flatten(i, s, p, r)
end

function M.table_to_string(tbl)
  local result = "{\n"
  for k, v in pairs(tbl) do
    -- Check the key type (ignore any numerical keys - assume its an array)
    if type(k) == "string" then
      result = "  " .. result .. "[\"" .. k .. "\"]" .. "="
    end

    -- Check the value type
    if type(v) == "table" then
      result = result .. "\n" .. M.table_to_string(v) .. "\n"
    elseif type(v) == "boolean" or type(v) == "function" then
      result = result .. tostring(v)
    else
      result = result .. "\"" .. v .. "\""
    end
    result = result .. ",\n"
  end
  -- Remove leading commas from the result
  if result ~= "" then
    result = result:sub(1, result:len() - 1)
  end
  return result .. "\n}"
end

function M.insert_between_items(src, sep, res)
  local result = res or {}
  local i = 1
  while true do
    table.insert(result, src[i])
    if i < #src then
      table.insert(result, sep)
    else
      break
    end

    i = i + 1
  end

  return result
end

function M.firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

function M.read_json_file(filename)
  local Path = require("plenary.path")

  local path = Path:new(filename)
  if not path:exists() then
    return nil
  end

  local json_contents = path:read()
  local json = vim.fn.json_decode(json_contents)

  return json
end

function M.is_npm_package_installed(package)
  local package_json = M.read_json_file("package.json")
  if not package_json then
    return false
  end

  if package_json.dependencies and package_json.dependencies[package] then
    return true
  end

  if package_json.devDependencies and package_json.devDependencies[package] then
    return true
  end

  return false
end

vim.g.utils = M
