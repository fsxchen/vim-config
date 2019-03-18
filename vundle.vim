set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'https://github.com/mindriot101/vim-yapf.git'
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'taglist.vim'
Plugin 'winmanager'
"
" Commentary: 快速注释。
Plugin 'tpope/vim-commentary'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" 自动补全
if v:version >= 704 && has('python')
	Bundle 'Valloric/YouCompleteMe'
endif
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
Bundle 'https://github.com/davidhalter/jedi-vim.git'

"python自动补全

"目录树插件
Bundle 'https://github.com/scrooloose/nerdtree.git'
" 代码块
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'

"auto pairs
Bundle 'https://github.com/jiangmiao/auto-pairs.git'

" vim-snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'https://github.com/garbas/vim-snipmate.git'
Bundle 'tomtom/tlib_vim'

" 代码检查
Bundle 'https://github.com/vim-syntastic/syntastic.git'

" git 插件
Plugin 'fugitive.vim'

" 透明设置
Plugin 'VimTweak'
