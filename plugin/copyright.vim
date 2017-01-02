function! PrintCStyleCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '// Copyright: ThoughtSpot Inc ' . year)
  call setline(2, '// Author: Naresh Kumar (naresh.kumar@thoughtspot.com)')
endfunction

function! PrintPythonCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '#!/usr/bin/python')
  call setline(2, '')
  call setline(3, '# Copyright: ThoughtSpot Inc ' . year)
  call setline(4, '# Author: Naresh Kumar (naresh.kumar@thoughtspot.com)')
endfunction

function! PrintBashCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '#!/bin/bash')
  call setline(2, '')
  call setline(3, '# Copyright: ThoughtSpot Inc ' . year)
  call setline(4, '# Author: Naresh Kumar (naresh.kumar@thoughtspot.com)')
endfunction


au BufNewFile *.{cpp,h,hpp,go} :call PrintCStyleCopyright()
au BufNewFile *.py :call PrintPythonCopyright()
au BufNewFile *.sh :call PrintBashCopyright()
