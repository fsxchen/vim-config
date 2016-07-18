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
