augroup fileType
  " 具体编辑文件类型的一般设置，比如不要 tab 等
  autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
  " autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  " autocmd FileType ruby,javascript,html,css,xml set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript
  autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
  autocmd BufRead,BufNewFile *.scss,*.less,*sass set filetype=css
  autocmd FileType json syntax match Comment +\/\/.\+$+ "jsonc highlight
  "不一定有效  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.html tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  autocmd BufRead,BufNewFile *.part set filetype=html
  autocmd BufRead,BufNewFile *.html set filetype=html.vue " 使得在html里面也可以用vls进行配置
  " autocmd BufRead,BufNewFile *.vue set filetype=vue.html.javascript.css.typescript
  " autocmd BufRead,BufNewFile *.vue,*.jsx setlocal filetype=css.html.javascript tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd BufRead,BufNewFile *.wxml,*.shtml set filetype=html tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.wxss set filetype=css tabstop=2 shiftwidth=2 softtabstop=2
augroup end
