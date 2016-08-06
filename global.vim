"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese
 
"语言设置
set langmenu=zh_CN.UTF-8
 
"设置语法高亮
syntax enable
syntax on
 
" 配色方案
set background=dark
"colorscheme solarized
"colorscheme molokai
"colorscheme phd
colorscheme torte
"设置行号"
set number
"可以在buffer的任何地方使用鼠标
 
"高亮显示匹配的括号
set showmatch

 
" 置粘贴模式，这样粘贴过来的程序代码就不会错位了。 
set paste

" 高亮搜索的关键字 
set hlsearch 
" 
" 搜索忽略大小写 
set ignorecase "

"设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

set foldmethod=indent       " 使用缩进折叠
set foldlevel=10        " 打开文件时只折叠超过10层以上的
set foldmethod=syntax
nnoremap <space> za    
" 空格操作
vnoremap <space> zf
" 空格操作
"
"
"
" NERDTree的目录
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore=['\.pyc$']	"ignore file in NERDTree


" 代码块显示
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1


" NERDTreeToggle
nnoremap <F2> :exe 'NERDTreeToggle'<CR> 



"""""""""""""""""""""""""""""""""""""""""
""实现上面函数中的，Last modified功能
"""""""""""""""""""""""""""""""""""""""""
autocmd BufWrite,BufWritePre,FileWritePre  *.c,*.py    ks|call LastModified()|'s  
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

"新建.c,.h,.sh,.java文件，自动插入文件头 
"""" """autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.vim,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
""""func SetTitle() 
""""	"如果文件类型为.sh文件 
""""	if &filetype == 'sh' 
""""		call setline(1,"\#########################################################################")
""""		call append(line("."), "\# File Name: ".expand("%")) 
""""		call append(line(".")+1, "\# Description: ") 
""""		call append(line(".")+2, "\# Author: chu") 
""""		call append(line(".")+3, "\# Mail: ") 
""""		call append(line(".")+4, "\# Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
""""		call append(line(".")+5, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
""""		call append(line(".")+6, "\#########################################################################") 
""""		call append(line(".")+7, "\#!/bin/bash") 
""""		call append(line(".")+8, "") 
""""	elseif &filetype == 'py' 
""""		call setline(1,"\#!/usr/bin/env python") 
""""		call append(line("."), "\# File Name: ".expand("%")) 
""""		call append(line(".")+1, "\# Description: ") 
""""		call append(line(".")+2, "\# Author: chu") 
""""		call append(line(".")+3, "\# Mail: ") 
""""		call append(line(".")+4, "\# Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
""""		call append(line(".")+5, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
""""		call append(line(".")+6, "\#########################################################################") 
""""		call append(line(".")+7, "\#!/bin/bash") 
""""		call append(line(".")+8, "") 
""""	else 
""""		call setline(1, "/*************************************************************************") 
""""		call append(line("."),  "  * File Name: ".expand("%")) 
""""		call append(line(".")+1, "  * Description: ") 
""""		call append(line(".")+2, "  * Author: chu") 
""""		call append(line(".")+3, "  * Mail: ") 
""""		call append(line(".")+4, "  * Created_Time: ".strftime("%Y-%m-%d %X")) 
""""		call append(line(".")+5, "  * Last modified: ".strftime("%Y-%m-%d %X")) 
""""		call append(line(".")+6, " ************************************************************************/") 
""""		call append(line(".")+7, "")
""""	endif
	
"新建文件后，自动定位到文件末尾
""""	autocmd BufNewFile * normal G
""""    endfunc



