function! PrintCStyleCopyright()
  let year = system('date +"%Y"')[0:3]
  call append(0, '// Copyright: xxx Inc ' . year)
  call append(1, '// Author: Naresh Kumar (naresh.kumar@thoughtspot.com)')
endfunction

function! PrintPythonCopyright()
  let year = strftime("%Y-%m-%d %H:%M")
  call append(0, '#!/usr/bin/env python')
  call append(1, '')
  call append(2, '// ----------------------------------------')
  call append(3, '// * Author: xxx Inc ')
  call append(4, '// * Date: ' . year)
  call append(5, '// * Description: ')
  call append(6, '// *  ')
  call append(7, '// ----------------------------------------')
endfunction

function! PrintBashCopyright()
  let year = strftime("%Y-%m-%d %H:%M")
  call append(0, '#!/bin/bash')
  call append(1, '')
  call append(2, '// ----------------------------------------')
  call append(3, '// * Author: xxx Inc ')
  call append(4, '// * Date: ' . year)
  call append(5, '// * Description: ')
  call append(6, '// *  ')
  call append(7, '// ----------------------------------------')
endfunction


" Add PHP Author
function! PrintPhpCopyright()
  let year = strftime("%Y-%m-%d %H:%M")
  "call append(1, '#!/usr/bin/env php')
  call append(0, '<?php')
  call append(1, '')
  call append(2, '// ----------------------------------------')
  call append(3, '// * Author        : xxx Inc ')
  call append(4, '// * Date          : ' . year)
  call append(5, '// * Last modified : ' . year)
  call append(6, '// * Filename      : ' .expand("%:t"))
  call append(7, '// * Description   : ')
  call append(8, '// *  ')
  call append(9, '// ----------------------------------------')
endfunction

"Add PHP Author Or Update Infomation
function! AddPhpAuthor()
        let n=1
        while n < 10
                let line = getline(n)
                if line =~'^\/\/\s\*\sLast\s*modified\s:\s.*$'
                        call UpdateTitle()
                        return
                endif
                let n = n + 1
        endwhile
        call PrintPhpCopyright()
endfunction


"Update Title 
function! UpdateTitle()
        normal m'
        execute '/\s\*\sLast modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
        normal ''
        normal mk
        execute '/\s\*\sFilename\s*:/s@:.*$@\=": ".expand("%:t")@'
        execute "noh"
        normal ''
        normal 'k
endfunction

au BufNewFile *.{cpp,h,hpp,go} :call PrintCStyleCopyright()
au BufNewFile *.py :call PrintPythonCopyright()
au BufNewFile *.sh :call PrintBashCopyright()

"php file type
au BufNewFile *.php :call AddPhpAuthor()
au BufWrite *.php :call AddPhpAuthor()
