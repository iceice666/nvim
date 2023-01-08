local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local function isInclude(obj, table)
  if type(obj) == "table" then
    for _, k in ipairs(obj) do
      if isInclude(k, table) then
        return true
      end
      return false
    end

  else
    for _, k in ipairs(table) do
      if obj == k then
        return true
      end
      return false
    end

  end
end

return {
  split = split,
  isInclude = isInclude,
}
