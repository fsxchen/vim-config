au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix


" autocmd BufNewFile,BufRead *.py nmap <F5> :!python %<CR>
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR> 
autocmd BufNewFile,BufRead *.py nmap <F3> :call SetPyTitle()<CR>

autocmd BufNewFile *.py exec ":call SetPyTitle()" 

func SetPyTitle() 
	call setline(1,"\#!/usr/bin/env python")
	call append(line("."), "\# -*- coding:utf-8 -*- ")
	call append(line(".")+1, "'''")
	call append(line(".")+2, "File Name: ".expand("%")) 
    call append(line(".")+3, "Description: ") 
    call append(line(".")+4, "Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
    call append(line(".")+5, "Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
	call append(line(".")+6, "'''")
	call append(line(".")+7, "_author = 'arron'")
	call append(line(".")+8, "_email = 'fsxchen@gmail.com'")
	autocmd BufNewFile * normal G
endfunc


" python debug
autocmd BufNewFile,BufRead *.py nmap <F3> :!pdb %<CR>
