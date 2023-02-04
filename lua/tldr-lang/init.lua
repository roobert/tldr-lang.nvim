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
		-- * load a list of types and files from a config..
		-- * render buffer as markdown
		-- * add some function or command to automatically add new tldr docs..
		-- * add a backup mechanism to finding type (tree-sitter?)

		if not type then
			P(type)
			print("[" .. filetype .. "] failed opening tldr-lang for unknown: " .. first_line)
			return
		end

		if type == "list" or type == "array" then
			file = "array"
		elseif type == "dict" then
			file = "dict"
		elseif type == "string" or type == "Literal" or type == "str" then
			file = "string"
		end

		local info = debug.getinfo(1, "S")
		local script_path = info.source:sub(2)
		local plugin_dir = script_path:match("(.*/)")

		-- should this be a previw-window?
		vim.api.nvim_command("split " .. plugin_dir .. "../../doc/" .. filetype .. "/" .. file .. ".md")

		-- local win_id = vim.api.nvim_get_current_win()
		-- local buf_id = vim.api.nvim_get_current_buf()

		-- vim.api.nvim_buf_set_name(buf_id, "TLDR-Lang")
		-- vim.api.nvim_set_option_value("wrap", false, { win = win_id })
		-- vim.api.nvim_set_option_value("cursorline", false, { win = win_id })
		-- vim.api.nvim_set_option_value("number", false, { win = win_id })
		-- vim.api.nvim_set_option_value("relativenumber", false, { win = win_id })

		-- vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf_id })
		-- vim.api.nvim_set_option_value("swapfile", false, { buf = buf_id })
		-- vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf_id })
		-- vim.api.nvim_set_option_value("filetype", "nvim-search-replace", { buf = buf_id })
		-- vim.api.nvim_set_option_value("modifiable", false, { buf = buf_id })
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
