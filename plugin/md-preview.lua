local loaded = vim.g.loaded_md_preview or 0
if loaded == 0 then
	vim.g.loaded_md_preview = 1
	-- Register commands
	vim.cmd([[
    command! MPToggle lua require('md-preview').toggle()
    command! MPOpen lua require('md-preview').open()
    command! MPClose lua require("md-preview").close()
    command! MPRefresh lua require("md-preview").refresh()
  ]])
end
