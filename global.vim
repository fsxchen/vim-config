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
"colorscheme atom-dark-256
colorscheme monokai
"colorscheme molokai
"colorscheme phd
"colorscheme torte

"设置行号"
set number
"可以在buffer的任何地方使用鼠标
 
"高亮显示匹配的括号
set showmatch


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

"----------------------------------
"设置文件的折叠
"----------------------------------

set foldenable
set foldmethod=syntax       " 使用缩进折叠
set foldcolumn=0
set foldlevel=1        " 打开文件时只折叠超过10层以上的
set foldclose=all
set foldlevelstart=99
set foldopen-=search
set foldopen-=undo

nnoremap <Space> @=((foldclosed(line('.'))<0)?'zc':'zo')<cr>

" zm 折叠全部
" zc 打开全部折叠"

nnoremap <space> zm    
" 空格操作
vnoremap <space> zc
" 空格操作


"-----------------------------------
" NERDTree的目录
"-----------------------------------
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
" 自动运行脚本
"""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.py nmap <F5> :call AutoRun()<CR>
map <C-r> :call AutoRun()<CR>

func AutoRun()
	let abs_file_name = expand("%:p")
	let file_ext = expand("%:e")
	let args = input("input args:")
	let cmd_arg = tr(args, '\n', '')

	if &filetype == 'python'
		let file_cmd = '/usr/bin/env python'
		if file_cmd != ""
			echo "The executable file to compile ". file_ext . " type files."
			let cmd = "! ". file_cmd . ' ' . abs_file_name . ' ' . args
			"echo""执行命令: ".cmd
			exec cmd
		endif
	endif
	if &filetype == 'c'
	    let f_name = expand("%:t")
		call BuildC(abs_file_name, f_name, args)
		call RunC(f_name)
	endif
endfunc

func BuildC(abs_file_name, f_name, args)
	let GCC = 'gcc'
	let out_file = split(a:f_name, '\.')[0]
	let cmd = "! ". GCC. ' '. a:abs_file_name .' '. a:args .'-o '. out_file
	exec cmd

endfunc

func RunC(filename)
	let start_cmd = split(a:filename, '\.')[0]
    let cmd = "! ./". start_cmd 
	exec cmd
endfunc


"""""""""""""""""""""""""""""""""""""""""
""实现上面函数中的，Last modified功能
"""""""""""""""""""""""""""""""""""""""""
autocmd BufWrite,BufWritePre,FileWritePre  *.c,*.py    ks|call LastModified()|'s  

func UpdateTitle(line)
    exe a:line."g/Last modified: /s/Last modified: .*/Last modified:".
    		\strftime(" %Y-%m-%d %X" ) . "/e"
endfunc

func LastModified()
	let n=1
	while n < 10
		let line = getline(n)
		if line =~'Last\smodified:\s\S*.*$'
			call UpdateTitle(n)
			return
		endif
		let n = n+1
	endwhile
endfunc

""""""""""""""""""""

