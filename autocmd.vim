augroup fileType
  " 具体编辑文件类型的一般设置，比如不要 tab 等
  autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
  " autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  " autocmd FileType ruby,javascript,html,css,xml set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  " autocmd BufNewFile,BufRead *.tsx,*ts set filetype=typescript
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  " autocmd FileType typescript.tsx,javascript.jsx set iskeyword+=- " 在样式文件里面写了.my-class类名后，在tsx,jsx文件中可以自动提示my-class，不仅是my
  autocmd FileType javascript,typescript.tsx,javascript.jsx,typescript set formatprg="\veslint_d --stdin --fix"

  autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
  autocmd BufRead,BufNewFile *.css set filetype=css
  autocmd BufRead,BufNewFile *.less set filetype=less
  autocmd BufRead,BufNewFile .scss,*sass set filetype=scss
  autocmd FileType scss,less setl iskeyword+=@-@ " @开头的变量名可以进行自动补全

  autocmd FileType json syntax match Comment +\/\/.\+$+ "jsonc highlight
  "不一定有效  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.html tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  autocmd BufRead,BufNewFile *.part set filetype=html
  " autocmd BufRead,BufNewFile *.html set filetype=html.vue " 使得在html里面也可以用vls进行配置
  " autocmd BufRead,BufNewFile *.vue set filetype=vue.html.javascript.css.typescript
  " autocmd BufRead,BufNewFile *.vue,*.jsx setlocal filetype=css.html.javascript tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
  autocmd BufRead,BufNewFile *.wxml,*.shtml set filetype=html tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.wxss set filetype=css tabstop=2 shiftwidth=2 softtabstop=2
augroup end

