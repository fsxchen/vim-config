au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=110 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix


autocmd BufNewFile,BufRead *.py nmap <F3> :!pdb %<CR>
" autocmd BufNewFile,BufRead *.py nmap <F5> :!python %<CR>
" python debug
autocmd BufNewFile,BufRead *.py nmap <F3> :call SetPyTitle()<CR>


func SetPyTitle() 
	call append(0, "\# -*- coding:utf-8 -*- ")
	call append(1,"\#!/usr/bin/env python")
	call append(2, "\"\"\"")
	call append(3, "File Name: ".expand("%")) 
	call append(4, "Description: ") 
	call append(5, "Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
	call append(6, "Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
	call append(7, "\"\"\"")
	call append(8, "")
	call append(9, "_author = 'arron'")
	call append(10, "_email = 'fsxchen@gmail.com'")
	autocmd BufNewFile * normal G
endfunc


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
"打开文件时检测
let g:syntastic_check_on_open = 1
"写文件时检测
let g:syntastic_check_on_wq = 0
"指定执行pylint时的conf
let g:syntastic_python_pylint_post_args = '~/.pylint/pylint_conf/pylint_conf/pylint_pycqa.conf'
let g:syntastic_python_checkers = ['pylint']

