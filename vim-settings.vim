" >>>=========文件类型侦测============
" 文件类型侦测
set pyxversion=3
set pythonthreehome=/usr/bin/python3
filetype on         " 开启文件类型侦测
filetype plugin on  " 根据侦测到的不同类型加载对应的插件
filetype indent on  " 针对不同的文件类型采用不同的缩进格式

" >>>=========缩进============
set shiftwidth=2    " 设置空格为4
set tabstop=2
set autoindent
set expandtab
set ai "Auto indent
set si "Smart indent
if has("gui") && has("win32")
  set lines=45 columns=180 " 启动后的宽高
elseif has("gui") && has("mac")
  set lines=65 columns=230 " 启动后的宽高
endif

" >>>=========vim 自身（非插件）快捷键============

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
set mouse=a         " h mouse

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


" >>>================字体===================
" set guifont=Monaco:h14
" set guifont=Menlo:h14
set linespace=1
set foldlevel=1  " 折叠层级
" set guifont=Fira\ Code:h14
set guifont=Source\ Code\ Pro:h15
" set guifont=Cascadia\ Code: h15
if has("win32")
  " set guifont=Ubuntu\ Mono:h12
endif
if has("mac")
  " set guifont=Ubuntu\ Mono:h17
endif
" Set extra options when running in GUI mode
if has("gui") && has("mac")
    set macligatures
endif
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guioptions-=m
    set t_Co=256
    set guitablabel=%M\ %t
endif
syntax enable

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=50
set termguicolors     " enable true colors support
