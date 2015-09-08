execute pathogen#infect()
filetype plugin indent on

"color
set nu
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

