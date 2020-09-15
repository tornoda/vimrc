" 快捷键的前缀，即 <Leader>
let mapleader=";"



" 让配置变更立即生效
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>v :edit $MYVIMRC<cr> "快速打开vimrc

" augroup formatWhenSave
"   " 保存文件前自动使用neoformat文件
"   autocmd BufWritePre,InsertLeave *.jsx,*.js,*.json,*.css,*.scss,*.sass,*.html,*.less,*.vue Neoformat prettier
" augroup END


" >>>=========文件类型侦测============
" 文件类型侦测
filetype on         " 开启文件类型侦测
filetype plugin on  " 根据侦测到的不同类型加载对应的插件
filetype indent on  " 针对不同的文件类型采用不同的缩进格式
runtime macros/matchit.vim " 配对 %

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
" >>>=========缩进============
set shiftwidth=2    " 设置空格为4
set tabstop=2
set autoindent
set expandtab
set ai "Auto indent
set si "Smart indent
" >>>=========vim 自身（非插件）快捷键============
vnoremap <Leader>y "*y:echo 'Copied'<CR>        " 设置快捷键将选中文本块复制至系统剪贴板
nnoremap <Leader>q :q<CR>
" nnoremap <silent> + o<esc>         " 在下发插入一行
nnoremap <silent> <Leader>w :w<CR>         " 定义快捷键保存当前窗口内容
nnoremap <silent> <Leader>s :wa<CR>         " 定义快捷键保存当前窗口内容
nnoremap <silent> <Leader>wj :sp<CR><c-w>j  " 下面新开一个窗口，并把光标移动到新窗口
nnoremap <silent> <Leader>wl :vsp<CR><c-w>l
nnoremap <silent> <leader>sa ggVG  
nnoremap <silent> <space> viwh "空格选中当前文本对象
nnoremap <silent> <leader>d dd " 删除一行
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

" test
onoremap p i(

nnoremap <silent> 'k <c-w>k:q<cr>
nnoremap <silent> 'j <c-w>j:q<cr>
nnoremap <silent> 'h <c-w>h:q<cr>
nnoremap <silent> 'l <c-w>l:q<cr>


" >>>================其他===================
set autoread " Set to auto read when a file is changed from the outside
set helplang=cn
set langmenu=zh_CN.UTF-8
set completeopt=longest,menu " 自带代码补全？
set title " 窗口显示文件名
set encoding=utf-8
set smartindent "代码折叠
set ruler "显示当前列号，看右下角
set path=./*  "设置查找路径
set incsearch       " 开启实时搜索功能
set ignorecase      " 搜索时大小写不敏感
set hls
set nocompatible    " 关闭兼容模式
set wildmenu        " vim 自身命令行模式智能补全
set number          " 设置行号显示
set nowrap          " 禁止换行
set foldmethod=indent " 设置代码折叠
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set vb t_vb=
set tm=500
" set cursorcolumn
set cursorline
" set mouse=a         " 设置鼠标滚动
" set mouse=v   " 若要使用鼠标复制内容到剪切板

set scrolloff=4     " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
" :se so=7            " 上面配置的简写

" :se so=999          " 总在中间

" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 禁止滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 分屏窗口移动, Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <D-j> <C-f> " 下翻页
nnoremap <D-k> <C-b> " 上翻页

" >>>================字体===================
" set guifont=Monaco:h13
" set guifont=Menlo:h13
set linespace=1
set foldlevel=1  " 折叠层级
" set guifont=Fira\ Code:h13
set guifont=Ubuntu\ Mono:h15
" >>>================主题===================
" Set extra options when running in GUI mode
if has("gui_running")
    set macligatures
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
syntax enable
" >>>================ctags===================
nnoremap <f5> :!ctags -R<CR>  " f5刷新tgas
" autocmd BufWritePost * call system("ctags -R") " 每次保存文件时候自动调用ctags
" <<<=========================================

" >>>================Ulitsnips===================
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit='horizontal'

" >>>================coc.nvim===================
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=50
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :tabs<CR>
tnoremap <leader>b <c-w>:Buffers<CR>
tnoremap <leader>t <c-w>:tabs<CR>
tnoremap <D-t> <c-w>:tabnew<CR>
inoremap <silent> <c-l> <esc>$A
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

tmap <leader>1 <c-w>1gt
tmap <leader>2 <c-w>2gt
tmap <leader>3 <c-w>3gt
tmap <leader>4 <c-w>4gt
tmap <leader>5 <c-w>5gt
tmap <leader>6 <c-w>6gt
tmap <leader>7 <c-w>7gt
tmap <leader>8 <c-w>8gt
tmap <leader>9 <c-w>9gt
tmap <leader>0 <c-w>0gt
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Remap keys for gotos
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" ----------coc-snips
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                          \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" coc-eslint
" nnoremap <silent> <leader>fm :CocCommand eslint.executeAutofix<cr>

" set signcolumn=yes " 是否一致显示信号栏
" 使得vim的language server client 服务使用vls处理vue文件
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
" >>>================disable netrw===================
:let g:loaded_netrw       = 1
:let g:loaded_netrwPlugin = 1
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" airline 
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 0
let airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

">>================nerdtree===================
nnoremap <C-n> :NERDTreeToggle<CR> " 打开或关闭文件管理导航，control + n
nnoremap <silent> <Leader>l :NERDTreeFind<CR>zz "定位当前文件并居中
" autocmd vimenter * NERDTree " 启动时自动打开
let g:NERDTreeMapOpenInTab = 't'
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
" let NERDTreeShowHidden=1 "显示隐藏文件
" set sw=4 sts=4 et fdm=marker:
" >>>================vim-javascript===================
let g:javascript_plugin_jsdoc = 1 " 开启jsdoc
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1 " 开启flow语法高亮
" >>>================fzf===================
set rtp+=/usr/local/opt/fzf
nnoremap <leader>ff :FZF<CR>
nnoremap <c-p> :FZF<CR>
" nnoremap <leader>b :Buffers<CR>
" >>>================ale===================
" nnoremap <silent> gd :ALEGoToDefinition<CR> "跳转定义
" nmap tgd <Plug>(ale_go_to_definition_in_tab) "跳转定义
" nmap <leader>gd <Plug>(ale_go_to_definition_in_split)
" nnoremap <silent> <leader>h :ALEHover<CR> "悬浮信息
" nnoremap <silent> <leader>u <Plug>(ale_previous_wrap) "上一条提示信息
" nnoremap <silent> <leader>i <Plug>(ale_next_wrap) "下一条提示信息
" nmap <silent> <leader>fm <Plug>(ale_fix)
" let g:ale_set_balloons = 1
" let g:ale_completion_enabled = 1
" let g:ale_completion_delay = 50
" let g:ale_completion_tsserver_autoimport = 1
" let g:ale_completion_max_suggestions = 10
" let g:ale_cursor_detail = 1 
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'css': ['stylelint'],
" \   'scss': ['stylelint'],
" \}
" let g:ale_sign_error = 'x'
" let g:ale_sign_warning = '!'
" let g:ale_fix_on_save = 1
" let g:ale_lint_delay = 200
" let g:ale_lint_on_text_changed = 'always'
" >>>================bufferOnly===================
nnoremap <silent> <leader>x :Bonly!<CR> "仅保留当前buffer"
" >>>================ycm===================
" nnoremap <silent> gd :YcmCompleter GoTo<CR> "跳转定义
" let g:ycm_collect_identifiers_from_tags_files = 1 "allow从tags文件中拿提示
" let g:ycm_filepath_blacklist = {}
" let g:ycm_key_invoke_completion = '<c-l>'
" let g:ycm_semantic_triggers =  {
  " \   'javascript,typescript,jsx': ['re![a-zA-Z\.]+'],
  " \   'css,scss,sass': ['re![a-z:\s]+'],
  " \   'html': ['re![a-z>\/]+']
  " \ }
" >>>================indentLine===================
" let g:indentLine_char = '︳ '
" let g:indentLine_char = '┼'
" let g:indentLine_char = '︴'
" let g:indentLine_char = '⎸'
let g:indentLine_enabled = 0 " 默认不启用
let g:indentLine_color_gui = '#404143' "最浅
"let g:indentLine_color_gui = '#292C34' " 同onedark background
" let g:indentLine_color_gui = '#ffffff' " 同onedark background
let g:indentLine_fileTypeExclude = ['text', 'sh', 'json']
" >>>================grepper===================
nnoremap <silent> <leader>` :Grepper<CR>
" >>>================ayu===================
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" >>>================vim-fugitive===================
let g:fugitive_autoreload_status = 1

" >>>================terminal===================
" set termwinkey=' " terminal前缀key(ctrl的地位)
" nmap 't :terminal<CR> "
" tnoremap <c-j> <c-w><c-w>j " 与normal模式表现一致
" tnoremap <c-k> <c-w><c-w>k
" tnoremap <c-h> <c-w><c-w>h
" tnoremap <c-l> <c-w><c-w>l
" tnoremap <leader>h <c-w>:hide!<CR>
" tnoremap <leader>k <c-w>:quit!<CR>
tnoremap <leader>c <c-w>:close!<CR>
tnoremap <leader> <c-w>
" >>>================nerd_commenter===================
let g:NERDSpaceDelims = 1 "注释后加空格
let g:NERDCustomDelimiters={
	\ 'javascript.jsx': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" >>>================emmet===================
let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'jsx' : {
  \    'extends' : 'html',
  \  },
  \ 'wxss': {
  \   'extends': 'css',
  \ },
  \ 'wxml': {
  \   'extends': 'html',
  \   'aliases': {
  \     'div': 'view',
  \     'span': 'text',
  \  },
  \ 'default_attributes': {
  \    'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
  \    'navigator': [{'url': '', 'redirect': 'false'}],
  \    'scroll-view': [{'bindscroll': ''}],
  \    'swiper': [{'autoplay': 'false', 'current': '0'}],
  \    'icon': [{'type': 'success', 'size': '23'}],
  \    'progress': [{'precent': '0'}],
  \    'button': [{'size': 'default'}],
  \    'checkbox-group': [{'bindchange': ''}],
  \    'checkbox': [{'value': '', 'checked': ''}],
  \    'form': [{'bindsubmit': ''}],
  \    'input': [{'type': 'text'}],
  \    'label': [{'for': ''}],
  \    'picker': [{'bindchange': ''}],
  \    'radio-group': [{'bindchange': ''}],
  \    'radio': [{'checked': ''}],
  \    'switch': [{'checked': ''}],
  \    'slider': [{'value': ''}],
  \    'action-sheet': [{'bindchange': ''}],
  \    'modal': [{'title': ''}],
  \    'loading': [{'bindchange': ''}],
  \    'toast': [{'duration': '1500'}],
  \    'audio': [{'src': ''}],
  \    'video': [{'src': ''}],
  \    'image': [{'src': '', 'mode': 'scaleToFill'}],
  \  }
  \ },
  \}
" >>>================prettier===================
" let g:neoformat_run_all_formatters = 1
noremap <silent> <leader>fm :Neoformat<CR>
nnoremap <silent> <Leader>fw :Neoformat<CR>:w<CR>         " 定义快捷键保存当前窗口内容
" let g:neoformat_verbose = 1

" css scss
let g:neoformat_css_stylelint = {
            \ 'exe': 'stylelint',
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_css = ['stylelint', 'prettier']

" javascript
let g:neoformat_javascript_eslint_d = {
            \ 'exe': 'eslint_d',
            \ 'args': ['--stdin', '--fix-to-stdout', '--debug'],
            \ 'stderr': 1,
            \ 'stdin': 1,
            \ }
let g:neoformat_javascript_prettiereslint = {
            \ 'exe': 'prettier-eslint',
            \ 'args': ['--stdin'],
            \ 'stdin': 1,
            \ }
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--parser babel', '--tab-width 4', '--print-width 120', '--config-precedence prefer-file', '--arrow-parens avoid', '--no-semi', '--single-quote'],
            \ 'stdin': 1,
            \ 'no_append': 1
            \ }
            " \ 'args': ['--config ~/cfg/prettier.config.js', '--parser babel'],
" let g:neoformat_enabled_javascript = ['prettiereslint']
" let g:neoformat_enabled_javascript = ['eslint_d', 'prettier']
let g:neoformat_enabled_javascript = ['prettier']

let g:neoformat_typescript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--config ~/cfg/prettier.config.js', '--parser babel'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_typescript = ['prettier']

" wxml
let g:neoformat_wxml_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--config ~/cfg/prettier.config.js', '--parser html'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_wxml = ['prettier']

" vue
let g:neoformat_vue_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--config ~/cfg/prettier.config.js', '--parser vue'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_vue = ['prettier']

" wxss
let g:neoformat_wxss_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--config ~/cfg/prettier.config.js', '--parser css'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_wxss = ['prettier']

" xml
let g:neoformat_xml_prettydiff = {
            \ 'exe': 'prettydiff',
            \ 'args': ['beautify'],
            \ 'stdin': 0,
            \ }
let g:neoformat_enabled_xml = ['prettydiff']
" >>>================airline===================
let g:airline#extensions#coc#enabled = 1

let g:git_messenger_always_into_popup = v:true
let g:git_messenger_include_diff = "current"

" >>>================vista===================
"function! NearestMethodOrFunction() abort
"  return get(b:, 'vista_nearest_method_or_function', '')
"endfunction

"set statusline+=%{NearestMethodOrFunction()}

"" By default vista.vim never run if you don't call it explicitly.
""
"" If you want to show the nearest function in your statusline automatically,
"" you can add the following line to your vimrc 
"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_disable_statusline = 1
let g:vista_icon_indent = [" ", " "]
let g:vista#renderer#icons = {
\   "function": "👉",
\   "variable": "👉",
\   "method": "👉",
\   "property": "👉",
\   "class": "👉",
\  }

" >>>================papercolor===================
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': { 
  \       'override' : {
  \         'folded_fg' : ['#C0C0C0', ''],
  \         'folded_bg' : ['#EAEAEA', ''],
  \         'cursorlinenr_bg' : ['#DDDDDD', ''],
  \         'cursorlinenr_fg' : ['#339900', ''],
  \         'cursorline' : ['#DDDDDD', ''],
  \         'cursor_bg' : ['#000000', ''],
  \         'cursor_fg' : ['#FFFFFF', ''],
  \         'cursorcolumn' : ['#FFFFF', ''],
  \         'vertsplit_fg' : ['#343434', ''],
  \         'visual_bg' : ['#343434', ''],
  \         'statusline_active_bg' : ['#DDDDDD', ''],
  \         'statusline_inactive_bg' : ['#DDDDDD', ''],
  \         'tabline_bg' : ['#DDDDDD', ''],
  \         'tabline_active_bg' : ['#343434', ''],
  \         'tabline_active_fg' : ['#FFFFFF', ''],
  \         'tabline_inactive_bg' : ['#DDDDDD', ''],
  \         'tabline_inactive_fg' : ['#343434', ''],
  \       }
  \     }
  \   }
  \ }


" >>>================plugin===================
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' " 文件管理器
" Plug 'ycm-core/YouCompleteMe' " 
Plug 'editorconfig/editorconfig-vim' " editorconfig支持
Plug 'joshdick/onedark.vim' " onedark theme
Plug 'posva/vim-vue' " vue语法高亮
Plug 'pangloss/vim-javascript' " js语法高亮
Plug 'leafgarland/typescript-vim' " ts语法高亮
Plug 'mxw/vim-jsx' " jsx 语法高亮
Plug 'jiangmiao/auto-pairs'
Plug 'andreshazard/vim-freemarker'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 自动补全插件
Plug 'airblade/vim-gitgutter' "git 工具-行内
Plug '/usr/local/opt/fzf' "文件搜索
Plug 'junegunn/fzf.vim' "vim文件搜索
Plug 'mhinz/vim-grepper' 
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter' "代码注释
" Plug 'Yggdroot/indentLine' "缩进对其线
Plug 'sbdchd/neoformat' "代码格式化
Plug 'tpope/vim-fugitive' "git
" Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'mattn/emmet-vim'
Plug 'srcery-colors/srcery-vim' "主题
Plug 'dracula/vim', { 'as': 'dracula' } " 主题
Plug 'altercation/vim-colors-solarized' " 主题
Plug 'chemzqm/wxapp.vim' " 这个是小程序coc支持
" Plug 'SirVer/ultisnips'  " snips engin
Plug 'honza/vim-snippets' " snippets source
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'endel/vim-github-colorscheme'
" Plug 'dracula/vim' " theme
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/matchit.zip' " % 配对拓展
" Plug 'mhartington/oceanic-next' " theme
Plug 'tpope/vim-commentary' " vim comment
" Plug 'arcticicestudio/nord-vim' " theme
" Plug 'jacoborus/tender.vim' " theme
Plug 'liuchengxu/vista.vim' " tags
Plug 'rhysd/git-messenger.vim' " 显示提交信息

" Plug 'zxqfl/tabnine-vim'
" Plug 'majutsushi/tagbar' " tagbar

call plug#end()
let g:srcery_italic = 1
set background=light
" colorscheme solarized
" colorscheme monokai
" colorscheme nord
colorscheme onedark
" colorscheme tender
" colorscheme srcery
" colorscheme mac_classic
" colorscheme molokai
" colorscheme ayu
" colorscheme PaperColor
" colorscheme github
" colorscheme OceanicNext
" colorscheme dracula

