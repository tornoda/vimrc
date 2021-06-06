function! TrimText(text)
  let str = a:text
  let res = substitute(str, '^\s*', '', 'g')
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

" js(x) onekey comment
function! CommentJSX() range
  let firstlinecontent = TrimText(getline(a:firstline))
  let lastlinecontent = TrimText(getline(a:lastline))
  let indent = indent(a:firstline)

  let isSingleLine = a:firstline is# a:lastline 
  let isMultiLine = !isSingleLine

  if isSingleLine
    " delete js singleline comment
    if firstlinecontent =~ '^//'
      let noCommentLine = substitute(firstlinecontent, '\/\/', '', '')
      let noCommentLine = GetIndentWhiteSpace(indent).TrimText(noCommentLine)
      call setline(a:firstline, noCommentLine)
      return 1
    endif

    " delete jsx singleline comment
    if firstlinecontent =~ '{/\*\+\s*<.*>\s*\*\+/}' " {/***  <Demo />  ***/}
      let noCommentLine = substitute(firstlinecontent, '{/\*\+\s*<', '<', '')
      let noCommentLine = substitute(noCommentLine, '>\s*\*\+/}', '>', '')
      let noCommentLine = GetIndentWhiteSpace(indent).noCommentLine
      call setline(a:firstline, noCommentLine)
      return 1
    endif

    " add jsx comment
    if firstlinecontent =~ '^<.*>$'
      let comment = GetIndentWhiteSpace(indent).'{/* '.TrimText(firstlinecontent).' */}'
      " echo 'comment: '.comment
      call setline(a:firstline, comment)
      return 1
    " elseif firstlinecontent !~ '^{/**}'
    else
      " add js comment
      let comment = GetIndentWhiteSpace(indent(a:firstline)).'// '.TrimText(firstlinecontent)
      call setline(a:firstline, comment)
      return 1
    endif
  endif

  if isMultiLine
    " remove js(x) comment
    if (firstlinecontent =~ '/\*\+' && lastlinecontent =~ '\s*\**/')
          \ || (firstlinecontent =~ '{/\*\+' && lastlinecontent =~ '\s*\**/}')
      :execute "normal! ".a:lastline."Gdd"
      :execute "normal! ".a:firstline."Gdd"
      return 1
      " add jsx comment
    elseif firstlinecontent =~ '^<'
      let beforecomment = GetIndentWhiteSpace(indent).'{/* '
      let aftercomment = GetIndentWhiteSpace(indent)."*/}"
      call append(a:firstline - 1, beforecomment)
      call append(a:lastline + 1, aftercomment)
      return 1
      " add js comment
    else
      let beforecomment = GetIndentWhiteSpace(indent).'/* '
      let aftercomment = GetIndentWhiteSpace(indent)."*/"
      call append(a:firstline - 1, beforecomment)
      call append(a:lastline + 1, aftercomment)
      return 1
    endif
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
