colorscheme koehler

syntax on
filetype on
filetype plugin on
filetype indent on

set nocompatible
set expandtab

set autoindent
set autoread

set hlsearch
set incsearch
set showmatch

set showcmd
set number

set shiftwidth=8
set tabstop=8
set smartcase

" Screen not support this
" set mouse=a

set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldlevelstart=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>

" ctags auto search tags, from current directory to parent recursively
set tags=tags;/

"  cnoreabbrev csf cs find

" cscope auto search index db, from current directory to parent recursively
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

let Tlist_show_One_File=1
let Tlist_Exit_OnlyWindow=99

