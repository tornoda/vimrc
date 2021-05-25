iabbrev author looyulong 
      \<cr>luyulong@126.com

function! Get_folder_uppercase_name()
  let name = expand("%:h")[strridx(expand("%:h"), "kj/") + 1:]
  echo name
  return name
endfunction
