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
  let firstlinecontent = getline(a:firstline)
  let lastlinecontent = getline(a:lastline)
  let indent = indent(a:firstline)

  let isJsx = IsJSX(a:firstline, a:lastline)
  let isSingleLine = a:firstline is# a:lastline 

  let jsSingle = isSingleLine && !isJsx " js单行
  let jsxSingle = isSingleLine && isJsx " jsx单行
  let jsMulti = !isSingleLine && !isJsx " js多行
  let jsxMulti = !isSingleLine && isJsx " jsx多行

  if jsSingle
  endif

  if jsxSingle
  endif

  if jsMulti
  endif

  if jsxMulti
  endif

  " 删除注释
  if isSingleLine 
    if isJsx
      if firstlinecontent =~ '{/\**' && lastlinecontent =~ '\**/}'
        :execute "normal! ".a:lastline."Gdd"
        :execute "normal! ".a:firstline."Gdd"
        return 0
      endif
    endif
  endif

  " 增加注释
  if isSingleLine
    " 单行注释
    if isJsx
      let curLine = GetIndentWhiteSpace(indent(a:firstline + 1)).'{/* '.TrimText(firstlinecontent).' */}'
      call setline(a:firstline, curLine)
    else
      let curLine = GetIndentWhiteSpace(indent(a:firstline)).'// '.TrimText(firstlinecontent)
      call setline(a:firstline, curLine)
    endif
  else
    " 多行注释
    let prefix = ''
    let surfix = ''
    if isJsx
      let prefix = '{'
      let surfix = '}'
    endif
    let firstlineComment = GetIndentWhiteSpace(indent).prefix.'/* '
    let lastlineComment = GetIndentWhiteSpace(indent)."*/".surfix
    call append(a:firstline - 1, firstlineComment)
    call append(a:lastline + 1, lastlineComment)
  endif
endfunction

function! IsJSX(startLine, endLine)
  let startLineContent = getline(a:startLine)
  let endLineContent = getline(a:endLine)
  let startLineTrimText = TrimText(startLineContent)
  let endLineTrimText = TrimText(endLineContent)

  if startLineTrimText =~ '^<' && endLineTrimText =~ '^<'
    return 1
  else
    return 0
  endif

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
