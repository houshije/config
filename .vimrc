" Basic Settings --------------------------------------
set nocompatible
filetype plugin on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 总是显示状态栏
set laststatus=2
" 开启行号显示
set number
" 开启语法高亮功能
syntax enable
" 允许使用指定语法高亮替换默认方案
syntax on
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符(tab)扩展为空格
set expandtab
" 设置编辑时制表符(tab)占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于语法进行折叠
set foldmethod=syntax
" 启动时关闭折叠代码
" za 打开、关闭 zM 关闭所有 zR 打开所有
set nofoldenable

" 智能匹配，搜索时不加大写字母忽略大小写
" 否则不忽略
set ignorecase smartcase

" 创建一个*.h文件，然后加入头
autocmd BufNewFile *.h :call SetTitle()
func SetTitle()
    if expand("%:e") == 'h'
        call setline(1, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line("."), "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+1, "")
        call append(line(".")+2, "#endif")
    endif
endfunc 

" 允许在vim中使用鼠标配置
if has('mouse')
    set mouse=a
endif
" 按键映射
" <F6> 可以使用鼠标
" <F7> 不可以使用鼠标
map <F6> :set mouse-=a<CR>
map <F7> :set mouse=a<CR>

" no backup
set nobackup
set nowritebackup
set noswapfile

"new create *.h file，auto insert file headers 
"autocmd BufNewFile *.h exec ":call SetTitle()"
autocmd BufNewFile * normal G

" use space instead of tab
set textwidth=80

" show the border
set nowrap

" set indent
set autoindent
set smartindent
set cindent

set colorcolumn=81
set hidden
set incsearch
set ruler
set showcmd
set title
set wildmenu
set wildmode=list:longest,list:full



" complete opts
set completeopt=menu,longest

" ignore files inside vcs dirs
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" ignore object code files
set wildignore+=*.o,*.obj,*.a,*.so,*.d

set fileencodings=ucs-bom,utf8,cp936,gbk,big5,euc-jp,euc-kr,gb18130,latin1


" Fonts -----------------------------------------------
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
set guifontwide=WenQuanYi\ Micro\ Hei\ Mono

" Vundle ----------------------------------------------
" Install Vundle:
" git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Usage:
" :BundleList            - list configured bundles
" :BundleInstall         - install(update) bundles
" :BundleSearch          - search for plugins
" :BundleClean           - confirm removal of bundles
"
" see :h vundle for more details or wiki for FAQ
let mapleader="\<space>"
let g:mapleader="\<space>"
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'

Plugin 'Clam'
Plugin 'Conque-Shell'
Plugin 'DoxygenToolkit.vim'
Plugin 'Gundo'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'godlygeek/tabular'

" Color Schemes
Plugin 'tomasr/molokai'

" Programming
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'

" Color Schemes ---------------------------------------
if has("gui_running")
    "set background=dark
    colorscheme molokai

    set guioptions-=T
    "set guioptions-=m
    "set guioptions-=r
    "set guioptions-=L
else
    set t_Co=256
    set background=dark
    colorscheme molokai
endif

" Plugins ---------------------------------------------
" ack.vim, Ack front-end for vim ----------------------
" http://www.vim.org/scripts/script.php?script_id=2572
" https://github.com/mileszs/ack.vim/
" git clone git://github.com/mileszs/ack.vim.git
" https://github.com/ggreer/the_silver_searcher/
let g:ackprg = 'ag --nogroup --nocolor --column'

" Clam ------------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=4000
" https://github.com/sjl/clam.vim
" https://bitbucket.org/sjl/clam.vim/
" hg clone https://bitbucket.org/sjl/clam.vim
nnoremap <leader>c :Clam<Space>

" Cscope ----------------------------------------------
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" ========customize=======
" open search
map <F2> :Ack 
" find git cinfict
map <F5> /=======<CR>
" ===================
set cscopequickfix=s-,c-,d-,i-,t-,e-

nnoremap <F3> :cp<CR>
nnoremap <F4> :cn<CR>

if has("cscope")  
  if filereadable("cscope.out")  
    cs add cscope.out  
  endif        
endif  

" CtrlP -----------------------------------------------
" https://github.com/ctrlpvim/ctrlp
" git clone git://github.com/ctrlpvim/ctrlp.git

" enable cache for ctrlp
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" only search the filename and use regex
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1

" cancel the limit to max files number
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" Doxygen ---------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="houshijie"

let g:DoxygenToolkit_briefTag_pre="@Synopsis"
let g:DoxygenToolkit_paramTag_pre="@Param:"
let g:DoxygenToolkit_paramTag_post=" - "
let g:DoxygenToolkit_returnTag="@Returns:"

" Gundo -----------------------------------------------
" http://sjl.bitbucket.org/gundo.vim/
" hg clone https://bitbucket.org/sjl/gundo.vim
nnoremap <leader>u :GundoToggle<CR>

let g:gundo_right = 1

" NERDTree --------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=1658
" http://github.com/scrooloose/nerdtree
" git clone git://github.com/scrooloose/nerdtree.git
nnoremap <leader>nt :NERDTreeToggle<CR>
map <F8> :NERDTree<CR>
let NERDTreeWinPos=1
let NERDTreeWinSize=30
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" SuperTab --------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=1643
" https://github.com/ervandew/supertab
" git clone git://github.com/ervandew/supertab.git
let g:SuperTabRetainCompletionType=1

" Tabular ---------------------------------------------
" http://github.com/godlikegeek/tabular
" git clone git://github.com/godlikegeek/tabular.git

" Tagbar ----------------------------------------------
" http://www.vim.org/scripts/script.php?script_id=3465
" http://github.com/majutsushi/tagbar
" git clone git://github.com/majutsushi/tagbar.git
" nnoremap <leader>tb :TagbarToggle<CR>
map <F9> :TagbarToggle<CR>

let g:tagbar_left = 1
let g:tagbar_width = 40

" let g:tagbar_//autoclose = 1
" let g:tagbar_autofocus = 0
" let g:tagbar_autoshowtag = 0

" let tags sorted according to their order int source files
let g:tagbar_sort = 0

let g:tagbar_ctags_bin = '/usr/bin/ctags'

" let Tagbar start with vim
" autocmd VimEnter * nested :TagbarOpen

" Ultisnips -------------------------------------------
" SirVer/ultisnips
" https://github.com/SirVer/ultisnips
" git clone git://github.com/SirVer/ultisnips.git

" remap Ultisnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" YouCompleteMe ---------------------------------------
" https://github.com/Valloric/YouCompleteMe
" git clone git://github.com/Valloric/YouCompleteMe.git

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_key_invoke_completion = '<C-a>'

" not need confirm when load a config file
let g:ycm_confirm_extra_conf=0

" Vim-airline -----------------------------------------
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" git clone git://github.com/vim-airline/vim-airline.git
" git clone git://github.com/vim-airline/vim-airline-themes.git
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Commands, Mappings and Functions --------------------
" Tags ------------------------------------------------
set tags=tags;
set autochdir
nnoremap <leader>gt :!ctags -R -f .tags<CR><CR>

" Find Conflict Marks ---------------------------------
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
