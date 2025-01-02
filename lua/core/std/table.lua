function table.merge(table1, table2)
  return vim.tbl_deep_extend("force", table1, table2)
end

function table.keys(table)
  return vim.tbl_keys(table)
end

function table.values(table)
  return vim.tbl_values(table)
end

function table.count(table)
  return vim.tbl_count(table)
end

function table.is_empty(table)
  return vim.tbl_isempty(table)
end

function table.get(table, key)
  return vim.tbl_get(table, key)
end

function table.map(table, func)
  return vim.tbl_map(func, table)
end

function table.filter(table, func)
  return vim.tbl_filter(func, table)
end

function table.contains(table, value)
  return vim.tbl_contains(table, value)
end

function table.is_list(table)
  return vim.islist(table)
end
