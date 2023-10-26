if exists("g:loaded_md_preview")
    finish
endif
let g:loaded_md_preview = 1

" Register commands
command! MPToggle lua require('md-preview').toggle()
command! MPOpen lua require('md-preview').open()
command! MPClose lua require('md-preview').close()
command! MPRefresh lua require('md-preview').refresh()
