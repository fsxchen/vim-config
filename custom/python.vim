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
