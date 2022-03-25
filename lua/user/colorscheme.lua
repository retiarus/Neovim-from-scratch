vim.cmd [[
try
  colorscheme gruvbox
  let g:gruvbox_contrast_dark = 'hard'
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

--vim.opt.termguicolors = true
