if $TERM ==# 'alacritty'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
 
" 系统按键映射
source ~/vimrc/mapping.vim
" 自动化脚本
source ~/vimrc/autocmd.vim
" vim设置
source ~/vimrc/vim-settings.vim

source ~/vimrc/themes/paperColor.default.light.vim

" github插件设置 + 插件按键映射
source ~/vimrc/plugin-settings.vim

source ~/vimrc/functions.vim

source ~/vimrc/vimdiff-settings.vim

" 我的插件
source ~/vimrc/plugin/index.vim
