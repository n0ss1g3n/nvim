_G.file = file or {}

---Return file content
---@param path string
---@return string The file content as one string
---@nodiscard
function file.get_content(path)
	---@diagnostic disable-next-line: return-type-mismatch
	return io.lines(path, "*a")
end

---Return file content
---@param path string
---@return integer The number of lines in the file
---@nodiscard
function file.line_count(path)
	local line_count = 0

	for _ in io.lines(path, "*L") do
		line_count = line_count + 1
	end

	return line_count
end
