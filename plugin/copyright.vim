function! PrintCStyleCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '// Copyright: xxx Inc ' . year)
  call setline(2, '// Author: Naresh Kumar (naresh.kumar@thoughtspot.com)')
endfunction

function! PrintPythonCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '#!/usr/bin/env python')
  call setline(3, '// ----------------------------------------')
  call setline(4, '// * Author: xxx Inc ')
  call setline(5, '// * Date: ' . year)
  call setline(6, '// * Description: ')
  call setline(7, '// *  ')
  call setline(8, '// ----------------------------------------')
endfunction

function! PrintBashCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '#!/bin/bash')
  call setline(3, '// ----------------------------------------')
  call setline(4, '// * Author: xxx Inc ')
  call setline(5, '// * Date: ' . year)
  call setline(6, '// * Description: ')
  call setline(7, '// *  ')
  call setline(8, '// ----------------------------------------')
endfunction

function! PrintPhpCopyright()
  let year = system('date +"%Y"')[0:3]
  call setline(1, '#!/usr/bin/env php')
  call setline(2, '<?php')
  call setline(3, '// ----------------------------------------')
  call setline(4, '// * Author: xxx Inc ')
  call setline(5, '// * Date: ' . year)
  call setline(6, '// * Description: ')
  call setline(7, '// *  ')
  call setline(8, '// ----------------------------------------')
endfunction


au BufNewFile *.{cpp,h,hpp,go} :call PrintCStyleCopyright()
au BufNewFile *.py :call PrintPythonCopyright()
au BufNewFile *.sh :call PrintBashCopyright()
au BufNewFile *.php :call PrintPhpCopyright()
