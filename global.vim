" =============================================================================  
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>  
" =============================================================================  
   
" -----------------------------------------------------------------------------  
"  < 判断操作系统是否是 Windows 还是 Linux >  
" -----------------------------------------------------------------------------  
let g:iswindows = 0  
let g:islinux = 0  
if(has("win32") || has("win64") || has("win95") || has("win16"))  
    let g:iswindows = 1  
else  
    let g:islinux = 1  
endif  
   
" -----------------------------------------------------------------------------  
"  < 判断是终端还是 Gvim >  
" -----------------------------------------------------------------------------  
if has("gui_running")  
    let g:isGUI = 1  
else  
    let g:isGUI = 0  
endif  
   


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
"set background=dark
"colorscheme solarized
colorscheme atom-dark-256
"colorscheme monokai
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
"
" 设置字体
set guifont=Monaco:h20

" 调整vim的窗口的大小
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   taglist 
" "
let Tlist_Use_Right_Window = 0 " 在左侧显示窗口
let Tlist_Compart_Format = 1 " 压缩方式
let Tlist_Exist_OnlyWindow = 1 " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close = 0 " 不要关闭其他文件的tags
let Tlist_Enable_Fold_Column = 0 " 不要显示折叠树 (鼠标可以点开)
" 如果 taglist 窗口是最后一个窗口，则退出 vim
"  
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth = 25 " taglist窗口宽度
nmap <silent> <leader>tl :Tlist<cr>
if has("win32") 
	let Tlist_Ctags_Cmd = ' ctags' "windows下必须空3个字符,否则解析成gs 
else 
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

"标签列表窗口显示或隐藏不影响整个gvim窗口大小
"let Tlist_Inc_Winwidth = 0
""设置tablist插件只显示当前编辑文件的tag内容，而非当前所有打开文件的tag内容
let Tlist_Show_One_File=1


"-----------------------------------
" NERDTree的目录
"-----------------------------------
let g:NERDTree_title = "[NERDTree]"
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
nnoremap <F2> :exe 'WMToggle'<CR> 


"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winmanager 
"
let g:winManagerWindowLayout='NERDTree|TagList, BufExplorer'
" let g:winManagerWindowLayout = 'FileExplorer|TagList'
" let g:winManagerWindowLayout = 'FileExplorer'
let g:winManagerWidth = 25
let g:defaultExplorer = 0
func! NERDTree_Start()  
	"执行一个退出命令，关闭自动出现的窗口"
	exec 'q'	
	exec 'NERDTree'  
endfunc  
  
func! NERDTree_IsValid()  
	return 1  
endfunc  
nmap wm :WMToggle<cr>
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
autocmd BufWinEnter \[Buf\ List\] setl nonumber

" 插件vim-commentary的在脚本中的配置,
autocmd FileType python,shell,coffee set commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe 的配置
" let g:ycm_global_ycm_extra_conf=‘~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py‘
let g:ycm_python_binary_path = 'python'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>



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

