"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese
 
"语言设置
set langmenu=zh_CN.UTF-8
 
"设置语法高亮
syntax enable
syntax on
 
"设置配色方案
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
nnoremap <space> za    
" 空格操作
vnoremap <space> zf
" 空格操作
