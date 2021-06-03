function! TrimText(text)
  let str = a:text
  let res = substitute(str, '\s', '', 'g')
  return res
endfunction

function! GetIndentWhiteSpace(count)
  let total = a:count
  let space = '' 
  while total > 0
    let space = space . ' '
    let total = total - 1
  endwhile
  return space
endfunction

function! GetReactComNameFromFileName()
  let head_path = expand("%:h")
  let name = head_path[strridx(head_path, "/") + 1:]
  return name
endfunction

function! GetHooksStateName()
  let curLine = getline(".")
  let stateName = TrimText(curLine)
  return stateName
endfunction

function! UpperCaseFirstLetter(text)
  let str = a:text
  " let curLine = getline(".")
  " let dividerIdx = strridx(curLine, " ")
  " let prefix = curLine[:dividerIdx]
  " let stateName = substitute(prefix, '\ ', '', 'g')
  " echom stateName
  let part1 = toupper(str[0])
  let part2 = str[1:]
  return part1 . part2
endfunction

function! GetRangeListLines() range
  let firstline = line("v")
  let lastline = line(".")
  " echo "firstline: ".firstline
  echo "lastline: ".lastline
  return [firstline, lastline]
endfunction

" 注意没有引号，还有range关键词
" 在range上只执行一次函数
function GetRangeList() range
  let firstline = a:firstline
  let lastline = a:lastline
  " echo "firstline: ". firstline
  " 获取range内容
  " let rangelines = getline(firstline, lastline)
  return [getline(firstline), getline(lastline)]
endfunction 

function! MultiCommentJSX() range
  let [firstlinecontent, lastlinecontent] = GetRangeList()
  let firstlineComment = GetIndentWhiteSpace(indent(a:firstline)) . "\{\/\* " . TrimText(firstlinecontent)
  let lastlineComment = lastlinecontent . " \*\/\}"
  call setline(a:firstline, firstlineComment)
  call setline(a:lastline, lastlineComment)
endfunction


function! ExtendUseState() 
  let hooksName = GetHooksStateName()
  let hooksMethod = 'set' . UpperCaseFirstLetter(hooksName)
  let exp = 'const [' . hooksName . ', '. hooksMethod. '] = useState()'
  let line = GetIndentWhiteSpace(indent(".")) . exp
  echo exp
  let curLineNumber = getcurpos()["1"]
  call setline(curLineNumber, line)
endfunction
