--- Replace content in a string
--- @param from string The string to search for
--- @param to string The string to replace to
--- @param input string The string to replace content in
--- @nodiscard
function string.replace(from, to, input)
  return string.gsub(input, from, to, nil)
end

--- Split a string by a string
--- @param separator string The boundary string
--- @param input string The input string
--- @return table
--- @nodiscard
function string.split(separator, input)
  return vim.split(input, separator, { plain = true })
end

function string.trim(input)
  return vim.trim(input)
end

function string.start_with(input, prefix)
  return vim.startswith(input, prefix)
end

function string.end_with(input, suffix)
  return vim.endswith(input, suffix)
end
