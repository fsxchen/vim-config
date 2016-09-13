au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix


autocmd BufNewFile,BufRead *.py nmap <F3> :!pdb %<CR>
autocmd BufNewFile,BufRead *.py nmap <F5> :call RunPyScript()<CR>
" autocmd BufNewFile,BufRead *.py nmap <F5> :!python %<CR>
" python debug
autocmd BufNewFile,BufRead *.py nmap <F3> :call SetPyTitle()<CR>


func SetPyTitle() 
	call append(0,"\#!/usr/bin/env python")
	call append(1, "\# -*- coding:utf-8 -*- ")
	call append(2, "'''")
	call append(3, "File Name: ".expand("%")) 
    call append(4, "Description: ") 
    call append(5, "Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
    call append(6, "Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
	call append(7, "'''")
	call append(8, "")
	call append(9, "_author = 'arron'")
	call append(10, "_email = 'fsxchen@gmail.com'")
	autocmd BufNewFile * normal G
endfunc


func RunPyScript()
    let file_name = expand("%:p")
	let file_ext = expand("%:e")
	let file_cmd = ""
	let args = input("input args:")
	let cmd_arg = tr(args, '\n', '')
	 
	let file_cmd = '/usr/bin/env python'
	let file_name = ' ' . file_name
    if file_cmd != ""
    	echo "The executable file to compile ". file_ext . " type files."
    	let cmd = "! ". file_cmd . ' ' . file_name . ' ' . args
    	"echo "执行命令: ". cmd
    	exec cmd
    endif
endfunc
