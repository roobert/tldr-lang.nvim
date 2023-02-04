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

		if not type then
			print("[" .. filetype .. "] failed opening tldr-lang for unknown: " .. first_line)
			return
		end

		if type == "list" or type == "array" then
			print("[" .. filetype .. "] opening array tldr..")
			file = "array"
		elseif type == "dict" then
			print("[" .. filetype .. "] opening dict tldr..")
			file = "dict"
		elseif type == "string" or type == "Literal" or type == "str" then
			print("[" .. filetype .. "] opening string tldr..")
			file = "string"
		else
			P(type)
			print("[" .. filetype .. "] failed opening tldr-lang for unknown: " .. first_line)
		end

		local info = debug.getinfo(1, "S")
		local script_path = info.source:sub(2)
		local plugin_dir = script_path:match("(.*/)")

		--print("split " .. plugin_dir .. "../../doc/" .. filetype .. "/" .. file .. ".md")
		vim.api.nvim_command("split " .. plugin_dir .. "../../doc/" .. filetype .. "/" .. file .. ".md")

		-- split +/Users/rw/.config/nvim/lua/tldr-lang/doc/python/.md

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
