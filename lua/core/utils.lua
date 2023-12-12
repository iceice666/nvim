local util = {}

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
util.flatten = flatten

local function table_to_string(tbl)
  local result = "{\n"
  for k, v in pairs(tbl) do
    -- Check the key type (ignore any numerical keys - assume its an array)
    if type(k) == "string" then
      result = "  " .. result .. "[\"" .. k .. "\"]" .. "="
    end

    -- Check the value type
    if type(v) == "table" then
      result = result .. "\n" .. table_to_string(v) .. "\n"
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
util.table_to_string = table_to_string

local function insert_between_items(src, sep, res)
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
util.insert_between_items = insert_between_items

local function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end
util.firstToUpper = firstToUpper

return util
