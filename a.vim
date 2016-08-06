"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Description: ") 
		call append(line(".")+2, "\# Author: chu") 
		call append(line(".")+3, "\# Mail: ) 
		call append(line(".")+4, "\# Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
		call append(line(".")+5, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
		call append(line(".")+6, "\#########################################################################") 
		call append(line(".")+7, "\#!/bin/bash") 
		call append(line(".")+8, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."),  "  * File Name: ".expand("%")) 
		call append(line(".")+1, "  * Description: ") 
		call append(line(".")+2, "  * Author: chu") 
		call append(line(".")+3, "  * Mail: ") 
		call append(line(".")+4, "  * Created_Time: ".strftime("%Y-%m-%d %X")) 
		call append(line(".")+5, "  * Last modified: ".strftime("%Y-%m-%d %X")) 
		call append(line(".")+6, " ************************************************************************/") 
		call append(line(".")+7, "")
	endif
	
"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc

"""""""""""""""""""""""""""""""""""""""""
""实现上面函数中的，Last modified功能
"""""""""""""""""""""""""""""""""""""""""
autocmd BufWrite,BufWritePre,FileWritePre  *.c    ks|call LastModified()|'s  
func LastModified()
	if line("$") > 20
		let l = 20
	else 
		let l = line("$")
	endif
	exe "1,".l."g/Last modified: /s/Last modified: .*/Last modified:".
			\strftime(" %Y-%m-%d %X" ) . "/e"
endfunc

""""""""""""""""""""


