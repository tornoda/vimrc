from vim import *

def commit():
  cr = vim.current.range
  cb = vim.current.buffer

  startLine = cr.start
  endLine = cr.end
  print(startLine)
  print(endLine)

  newR = cr[:]
  newR.insert(0, "{/*")
  newR.append("*/}")

  cb[startLine:endLine] = newR

commit()
