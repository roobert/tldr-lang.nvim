local api = vim.api
local ts = require("nvim-treesitter")

local M = {}

M.get_node = function()
	local bufnr = api.nvim_get_current_buf()
	local cursor = api.nvim_win_get_cursor(0)
	local parser = vim.treesitter.get_parser(bufnr)

	-- FIXME: - this +1 stuff..
	local row, col = cursor[1], cursor[2] + 1

	local ret

	parser:for_each_tree(function(tree)
		if ret then
			return
		end

		local root = tree:root()

		if root then
			local node = root:descendant_for_range(row - 1, col - 1, row - 1, col - 1)

			if node and node ~= root then
				ret = node
			end
		end
	end)

	if not ret then
		return nil, nil
	end

	local kind = ret:type()
	local typ = ret:symbol()

	print(kind, typ)

	if kind == "identifier" then
		typ = "fn"
	end

	return kind, typ
end

M.tldr = function()
	local kind, typ = M.get_node()

	if not kind then
		return
	end

	local cmd = string.format("tldr %s", typ)

	vim.cmd(cmd)

	-- FIXME:
	-- * search for the doc based on type of thing?
	-- * open the tldr doc in a buffer
	-- * render buffer as markdown
end

M.setup = function() end

return M
