if has("mac") 
  " source ~/.vim/my-vim-plugin/test.vim
  " cd ~/.vim/my-vim-plugin/
endif

" augroup formatWhenSave
"   " 保存文件前自动使用neoformat文件
"   autocmd BufWritePre,InsertLeave *.jsx,*.js,*.json,*.css,*.scss,*.sass,*.html,*.less,*.vue Neoformat prettier
" augroup END

runtime macros/matchit.vim " 配对 %

" >>>================coc.nvim===================
nnoremap <leader>fm :CocCommand eslint.executeAutofix<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :tabs<CR>
tnoremap <leader>b <c-w>:Buffers<CR>
tnoremap <leader>t <c-w>:tabs<CR>

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

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
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

" airline 
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 0
let airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

">>================nerdtree===================
augroup nerdtreedisablecursorline
	autocmd!
	autocmd FileType nerdtree setlocal nocursorline
augroup end
let NERDTreeHighlightCursorline = 1
nnoremap <C-n> :NERDTreeToggle<CR> " 打开或关闭文件管理导航，control + n
nnoremap <silent> <Leader>l :NERDTreeFind<CR>zz "定位当前文件并居中
" autocmd vimenter * NERDTree " 启动时自动打开
let g:NERDTreeMapOpenInTab = 't'
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeAutoDeleteBuffer = 1 " 删除文件时自动干掉buffer
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
" nnoremap <leader>ff :FZF<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <c-p> :FZF<CR>
" >>>================bufferOnly===================
nnoremap <silent> <leader>x :Bonly!<CR> "仅保留当前buffer"

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

nnoremap <silent> <leader>` :Rg 
" >>>================ayu===================
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" >>>================vim-fugitive===================
let g:fugitive_autoreload_status = 1

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
" noremap <silent> <leader>fm :Neoformat<CR>
" nnoremap <silent> <Leader>fw :Neoformat<CR>:w<CR>         " 定义快捷键保存当前窗口内容
" noremap <silent> <leader>fm :Prettier<CR>
" nnoremap <silent> <Leader>fw :Prettier<CR>:w<CR>         " 定义快捷键保存当前窗口内容
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

let g:neoformat_typescript_eslint_d = {
            \ 'exe': 'eslint_d',
            \ 'args': ['--stdin', '--config ./.eslintrc.js', '--fix-to-stdout'],
            \ 'stderr': 1,
            \ 'stdin': 1,
            \ }
let g:neoformat_typescript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--config ~/cfg/prettier.config.js', '--parser babel'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_typescript = ['eslint_d']

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

" >>>================ultisnips===================
" let g:UltiSnipsExpandTrigger = <c-l>

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
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 自动补全插件
Plug 'airblade/vim-gitgutter' "git 工具-行内
if has("mac")
  Plug '/usr/local/opt/fzf' "文件搜索
endif
Plug 'junegunn/fzf.vim' "vim文件搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "vim文件搜索
" Plug 'mhinz/vim-grepper' "fzf.vim替代
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter' "代码注释
" Plug 'Yggdroot/indentLine' "缩进对其线
Plug 'sbdchd/neoformat' "代码格式化
Plug 'tpope/vim-fugitive' "git
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'mattn/emmet-vim'
Plug 'srcery-colors/srcery-vim' "主题
Plug 'dracula/vim', { 'as': 'dracula' } " 主题
Plug 'altercation/vim-colors-solarized' " 主题
Plug 'chemzqm/wxapp.vim' " 这个是小程序coc支持
" Plug 'SirVer/ultisnips', { 'do': '/usr/local/bin/python3 install.py' }
Plug 'honza/vim-snippets' " snippets source
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kyoz/purify', { 'rtp': 'vim' } "theme
Plug 'endel/vim-github-colorscheme'
" Plug 'dracula/vim' " theme
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/matchit.zip' " % 配对拓展
" Plug 'mhartington/oceanic-next' " theme
Plug 'tpope/vim-commentary' " vim comment
Plug 'arcticicestudio/nord-vim' " theme
Plug 'jacoborus/tender.vim' " theme
Plug 'liuchengxu/vista.vim' " definition tree
Plug 'rhysd/git-messenger.vim' " 显示提交信息
Plug 'zacanger/angr.vim' " theme
" Plug 'yianwillis/vimcdoc' " 中文文档

" Plug 'majutsushi/tagbar' " tagbar

call plug#end()
let g:srcery_italic = 1
" set background=light
" colorscheme solarized
" colorscheme nord
" colorscheme onedark
" colorscheme tender
" colorscheme purify
" colorscheme srcery
" colorscheme mac_classic
" colorscheme molokai
" colorscheme ayu
colorscheme angr
" colorscheme PaperColor
" colorscheme github
" colorscheme OceanicNext
" colorscheme dracula



" syntax
hi Boolean gui=italic
hi Conditional gui=italic
hi Exception gui=italic
hi Function gui=italic
hi Keyword gui=italic
hi MatchParen gui=standout
hi Repeat gui=italic
hi Statement gui=italic
hi Identifier gui=italic
hi IncSearch gui=italic
hi Label gui=italic
hi Type gui=italic
hi Typedef gui=italic
hi StorageClass gui=italic
hi Structure gui=italic
hi Debug gui=italic
