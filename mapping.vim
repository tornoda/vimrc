" 快捷键的前缀，即 <Leader>
let mapleader=";"
" 让配置变更立即生效
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" 快速打开vimrc 
nnoremap <leader>v :edit $MYVIMRC<cr> 

" 系统快捷键
if has("win32")
  inoremap <silent> <BS> <esc>xi
  vnoremap <silent> <leader>c "*y
  map <silent> <leader>v "*p
endif

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap y "*y:echo '已复制到剪切板'<CR>        
nnoremap <Leader>q :q<CR>
" nnoremap <silent> + o<esc>         " 在下发插入一行
nnoremap <silent> <Leader>w :w<CR>         " 定义快捷键保存当前窗口内容
nnoremap <silent> <Leader>s :wa<CR>         " 定义快捷键保存当前窗口内容
nnoremap <silent> <Leader>wj :sp<CR><c-w>j  " 下面新开一个窗口，并把光标移动到新窗口
nnoremap <silent> <Leader>wl :vsp<CR><c-w>l
nnoremap <silent> <leader>sa ggVG  
nnoremap <silent> <space> viwh "空格选中当前文本对象
nnoremap <silent> <leader>d :bdelete<CR> " 删除当前buffer
imap <silent> <c-d> <esc>ddi
" nnoremap <silent> <C-o> o<esc> " 下面加一行
" nnoremap <Leader>WQ :wa<CR>:q<CR> " 定义快捷键保存所有窗口内容并退出 vim
"  nnoremap <Leader>Q :qa!<CR>       " 不做任何保存，直接退出 vim
 " di => 删除这行括号里面的内容; ci => 改变这行括号里面的内容
onoremap <silent> ( :<c-u>normal! ^f)vi(<cr>
onoremap <silent> ) :<c-u>normal! ^f)vi(<cr>
onoremap <silent> { :<c-u>normal! ^f}vi{<cr>
onoremap <silent> } :<c-u>normal! ^f}vi{<cr>
onoremap <silent> [ :<c-u>normal! ^f[vi]<cr>
onoremap <silent> ] :<c-u>normal! ^f[vi]<cr>
onoremap <silent> ' :<c-u>normal! ^f'vi'<cr>
onoremap <silent> " :<c-u>normal! ^f"vi"<cr>

" 分屏窗口移动, Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 上下翻页
if has("mac")
    nnoremap <D-j> <C-f>
    nnoremap <D-k> <C-b>
endif

if has("win32")
    nnoremap <A-j> <C-f>
    nnoremap <A-k> <C-b>
endif

" 插入模式下，回到行末
inoremap <silent> <c-l> <esc>$A
if has("win32")
" 插入模式下，回到行末
  inoremap <silent> <c-h> <esc>^i
endif

" tab切换快捷键
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 0gt

tmap <leader>1 <c-\><c-n>1gt
tmap <leader>2 <c-\><c-n>2gt
tmap <leader>3 <c-\><c-n>3gt
tmap <leader>4 <c-\><c-n>4gt
tmap <leader>5 <c-\><c-n>5gt
tmap <leader>6 <c-\><c-n>6gt
tmap <leader>7 <c-\><c-n>7gt
tmap <leader>8 <c-\><c-n>8gt
tmap <leader>9 <c-\><c-n>9gt
tmap <leader>0 <c-\><c-n>0gt

" >>>================terminal===================
tnoremap <leader>c <c-w>:close!<CR>
" 只需要按<leader>既可以进行ex命令执行
tnoremap <leader> <c-w>

if has("mac") 
  tnoremap <D-t> <c-w>:tabnew<CR>
endif
if has("win32") || has("unix")
  tnoremap <A-t> <c-\><c-n>:tabnew<CR>
  nnoremap <A-t> :tabnew<CR>
endif
