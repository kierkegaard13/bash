set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


filetype plugin indent on
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"color
set nu
set colorcolumn=80
syntax on

"search settings
set smartcase
set ignorecase
set hlsearch
set incsearch

"tab settings
set autoindent
set smartindent
set cindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"switch tabs
nmap <C-t> :tabedit 
nmap <C-m> :tabn<Enter>
nmap <C-n> :tabp<Enter>

" Useful
set wildmenu
set showmatch
set lazyredraw
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
nmap <F12> :tabedit ~/.vimrc<Enter>
nmap <C-s> :w<Enter>
nmap <C-l> :NERDTree<Enter>

" Delete extra spaces at the ends of lines.
nmap <F5> :%s/ \+$//g<Enter>:noh<Enter>

" search for too long lines
nmap <F7> /^.\{80}<Enter>

" Commenting and uncommenting
function! SetFiletypeOptions()
    if &filetype == 'python' || &filetype == 'pyrex' || &filetype == 'sh' || &filetype == 'make' || &filetype == 'gitconfig' || &filetype == 'conf'
       "commenting and uncommenting that uses '#'
       nmap <F2> :norm I#<Enter>j
       nmap <F4> :s/\(^\s*\)\@<=#/<Enter>:noh<Enter>j
       vmap <F2> :norm I#<Enter>j
       vmap <F4> :s/\(^\s*\)\@<=#/<Enter>:noh<Enter>j
    endif
    if &filetype == 'vim'
       "commenting and uncommenting that uses '"'
       nmap <F2> :norm I"<Enter>
       nmap <F4> :s/\(^\s*\)\@<="/<Enter>:noh<Enter>
       vmap <F2> :norm I"<Enter>
       vmap <F4> :s/\(^\s*\)\@<="/<Enter>:noh<Enter>
    endif
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
       "commenting and uncommenting that uses '//'
       nmap <F2> :norm I//<Enter>
       vmap <F2> :norm I//<Enter>
       nmap <F4> :s/\(^\s*\)\@<=\/\//<Enter>:noh<Enter>
       vmap <F4> :s/\(^\s*\)\@<=\/\//<Enter>:noh<Enter>
    endif
    if &filetype == 'haskell'
       "commenting and uncommenting that uses '-- '
       nmap <F2> :norm I-- <Enter>
       vmap <F2> :norm I-- <Enter>
       nmap <F4> :s/\(^\s*\)\@<=-- /<Enter>:noh<Enter>
       vmap <F4> :s/\(^\s*\)\@<=-- /<Enter>:noh<Enter>
    endif
    if &filetype == 'autohotkey' || &filetype == 'dosini' || &filetype == 'asm' || &filetype == 'csound'
       "commenting and uncommenting that uses ';'
       nmap <F2> :norm I;<Enter>
       vmap <F2> :norm I;<Enter>
       nmap <F4> :s/\(^\s*\)\@<=;/<Enter>:noh<Enter>
       vmap <F4> :s/\(^\s*\)\@<=;/<Enter>:noh<Enter>
    endif
    if &filetype == 'matlab'
       "commenting and uncommenting that uses '%'
       nmap <F2> :norm I%<Enter>
       vmap <F2> :norm I%<Enter>
       nmap <F4> :s/\(^\s*\)\@<=%/<Enter>:noh<Enter>
       vmap <F4> :s/\(^\s*\)\@<=%/<Enter>:noh<Enter>
    endif
    if &filetype == 'make'
        " GNU make needs actual tabs for indentation. Urgh.
        set noexpandtab
    else
        set expandtab
    endif
endfunction

au Filetype,BufEnter * call SetFiletypeOptions()

