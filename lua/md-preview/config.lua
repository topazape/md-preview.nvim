---@class ConfigOption
---@field md_viewer table
---@field term table
local defaults = {
	insert_mode_after_preview = true,
	viewer = {
		exec = "mdcat",
		exec_path = "",
		args = {},
	},
	-- Markdown preview term
	term = {
		-- reload term when rendered markdown file changed
		reload = {
			enable = true,
			events = { "InsertLeave", "TextChanged" },
		},
		direction = "vertical", -- choices: vertical / horizontal
		keys = {
			close = { "q" },
			refresh = "r",
		},
	},
}

local M = { plugin_name = "md-preview.nvim" }

---Get viewer exec path
---
---@return string
M.get_viewer_exec = function()
	local viewer = M.opts.viewer or {}
	local exec_path = ""
	if string.len(viewer["exec_path"]) > 0 then
		exec_path = viewer["exec_path"]
	else
		exec_path = viewer["exec"]
	end
	return exec_path
end

---Get viewer args
---
---@return string
M.get_viewer_args = function()
	local viewer = M.opts.viewer or {}
	local args = viewer["args"] or {}

	local unpacked_args = { unpack(args) }
	local args_string = table.concat(unpacked_args, " ")
	return args_string
end

---Assign options
---
---@param opts table
M.setup = function(opts)
	M.opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

M.setup({})

return M
