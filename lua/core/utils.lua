local function noop(...)
  return ...
end

local util = {}

local function flatten(t, sep, key_modifier, res)
  if type(t) ~= "table" then
    return t
  end

  if sep == nil then
    sep = "."
  end

  if res == nil then
    res = {}
  end

  if key_modifier == nil then
    key_modifier = noop
  end

  for k, v in pairs(t) do
    if type(v) == "table" then
      local v = flatten(v, sep, key_modifier, {})
      for k2, v2 in pairs(v) do
        res[key_modifier(k) .. sep .. key_modifier(k2)] = v2
      end
    else
      res[key_modifier(k)] = v
    end
  end
  return res
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
