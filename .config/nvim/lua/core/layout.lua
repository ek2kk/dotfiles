-- Russian layout keys, position by position, and the English keys they stand for
local ru =
  "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ"
local en = [[qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]

local M = {}

function M.langmap()
  return ru .. ";" .. en:gsub('[;,"\\]', "\\%0")
end

function M.to_en()
  local map = {}
  for i, char in ipairs(vim.fn.split(ru, "\\zs")) do
    map[char] = en:sub(i, i)
  end
  return map
end

return M
