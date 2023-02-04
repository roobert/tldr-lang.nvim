local M = {}

M.tldr = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	local filetype = vim.bo.filetype

	local params = {
		textDocument = { uri = bufname },
		position = { line = cursor[1] - 1, character = cursor[2] },
	}

	vim.lsp.buf_request(bufnr, "textDocument/hover", params, function(err, result, _, _)
		if err then
			error(tostring(err))
		end

		if not result then
			return
		end

		local doc = string.match(result.contents.value, "```(.*)```")
		local first_line = string.match(doc, "%w*\n(.*)\n")
		local type_components = vim.split(first_line, " ")
		local type = string.match(type_components[3], "(%w*)")

		-- TODO:
		-- * search for the doc based on kind and lang
		-- * load a list of kinds and files from a config..
		-- * open the tldr doc in a split or preview-window
		-- * render buffer as markdown
		-- * add some function or command to automatically add new tldr docs..

		if type == "list" or type == "array" then
			print("[" .. filetype .. "] opening array tldr..")
		elseif type == "dict" then
			print("[" .. filetype .. "] opening dict tldr..")
		elseif type == "string" or type == "Literal" or type == "str" then
			print("[" .. filetype .. "] opening string tldr..")
		else
			P(type)
			print("[" .. filetype .. "] failed opening tldr-lang for unknown: " .. first_line)
		end

		-- local cmd = string.format("tldr %s", typ)
		-- vim.cmd(cmd)

		-- use this or split..
		--vim.cmd("ped")
	end)
end

M.setup = function()
	-- TODO:
	-- allow custom keymap..
	vim.api.nvim_set_keymap(
		"n",
		"<leader>t",
		'<CMD>lua require("tldr-lang").tldr()<CR>',
		{ noremap = true, silent = true }
	)
end

return M
