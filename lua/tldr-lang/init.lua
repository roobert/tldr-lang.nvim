local M = {}

local config = require("tldr-lang.config")

M.status = ""

-- TODO:
-- * load a list of types and files from a config..
-- * render buffer as markdown
-- * add some function or command to automatically add new tldr docs..
-- * add a backup mechanism to finding type (tree-sitter?)
M.tldr = function()
	local filetype = vim.bo.filetype

	local lsp_node_kind, lsp_node_type, treesitter_node_type = require("node-type").get()

	local info = require("node-type").statusline()

	-- for values, see if treesitter lookup matches a known type..
	local type
	if treesitter_node_type == "string" or treesitter_node_type == '"' then
		type = "string"
	elseif treesitter_node_type == "list" or treesitter_node_type == "[" or treesitter_node_type == "]" then
		type = "list"
	elseif treesitter_node_type == "dictionary" or treesitter_node_type == "{" or treesitter_node_type == "}" then
		type = "dict"
	else
		-- if not a value, for references, use lsp kind
		type = lsp_node_kind
	end

	if not type then
		print("[" .. filetype .. "] failed opening tldr-lang for unknown type: " .. info)
		return
	end

	if type == "list" or type == "array" then
		file = "array"
	elseif type == "dict" then
		file = "dict"
	elseif type == "string" or type == "Literal" or type == "str" then
		file = "string"
	else
		print("[" .. filetype .. "] failed opening tldr-lang for unknown: " .. type)
		return
	end

	print(
		"[tldr-lang] attempting to open: "
			.. filetype
			.. "/"
			.. type
			.. "/"
			.. config.options["language"]
			.. "/"
			.. file
	)

	local plugin_info = debug.getinfo(1, "S")
	local script_path = plugin_info.source:sub(2)
	local plugin_dir = script_path:match("(.*/)")

	-- should this be a previw-window?
	vim.api.nvim_command(
		"split " .. plugin_dir .. "../../doc/" .. filetype .. "/" .. config.options["language"] .. "/" .. file .. ".md"
	)

	-- -- local win_id = vim.api.nvim_get_current_win()
	-- -- local buf_id = vim.api.nvim_get_current_buf()

	-- -- vim.api.nvim_buf_set_name(buf_id, "TLDR-Lang")
	-- -- vim.api.nvim_set_option_value("wrap", false, { win = win_id })
	-- -- vim.api.nvim_set_option_value("cursorline", false, { win = win_id })
	-- -- vim.api.nvim_set_option_value("number", false, { win = win_id })
	-- -- vim.api.nvim_set_option_value("relativenumber", false, { win = win_id })

	-- -- vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf_id })
	-- -- vim.api.nvim_set_option_value("swapfile", false, { buf = buf_id })
	-- -- vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf_id })
	-- -- vim.api.nvim_set_option_value("filetype", "nvim-search-replace", { buf = buf_id })
	-- -- vim.api.nvim_set_option_value("modifiable", false, { buf = buf_id })
end

M.setup = function(options)
	if options == nil then
		options = {}
	end

	-- merge user supplied options with defaults..
	for k, v in pairs(options) do
		config.options[k] = v
	end

	-- TODO:
	-- * allow custom keymap..
	-- * add binding to open index type thing?
	-- * add binding to generate new tldr docs?
	vim.api.nvim_set_keymap(
		"n",
		"<leader>t",
		'<CMD>lua require("tldr-lang").tldr()<CR>',
		{ noremap = true, silent = true }
	)
end

return M
