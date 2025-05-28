

-- splits a string on the separator
function string:split(separator)
  if separator == nil then
    separator = "%s"
  end
  local t = {}
  for str in string.gmatch(self, "([^" .. separator .. "]+)") do
    table.insert(t, str)
  end
  return t
end