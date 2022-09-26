" vimdiff config
if &diff
  set autoread " This will disable 'read-only to writeable' warnings

  " vimdiff color
  highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=#219176
  highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=#F08080 guibg=#F08080
  " highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=#ffba52
  " highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=#ffba52
  highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=white guibg=#219176
  highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=#219176
  highlight CursorLine cterm=bold ctermfg=10 ctermbg=88 gui=underline guifg=NONE guibg=NONE
endif

