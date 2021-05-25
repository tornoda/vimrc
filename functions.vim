function! GetReactComNameFromFileName()
  let head_path = expand("%:h")
  let name = head_path[strridx(head_path, "/") + 1:]
  return name
endfunction

function! GetHooksStateName()
  let curLine = getline(".")
  let dividerIdx = strridx(curLine, " ")
  let prefix = curLine[:dividerIdx]
  let stateName = substitute(prefix, '\ ', '', 'g')
  return stateName
endfunction

function! GetHooksStateMethod()
  let stateName = GetHooksStateName()
  " let curLine = getline(".")
  " let dividerIdx = strridx(curLine, " ")
  " let prefix = curLine[:dividerIdx]
  " let stateName = substitute(prefix, '\ ', '', 'g')
  " echom stateName
  let part1 = toupper(stateName[0])
  let part2 = stateName[1:]
  return 'set' . part1 . part2
endfunction
