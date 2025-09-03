syntax on

colorscheme default
"colorscheme slate
"colorscheme morning

" set accent coloring
highlight lineNr ctermfg=7
highlight Search ctermfg=0 ctermbg=10
"highlight MatchParen ctermfg=15 ctermbg=10
highlight MatchParen ctermfg=15
highlight DiffAdd ctermfg=15
highlight DiffChange ctermfg=11 ctermbg=0
highlight DiffDelete ctermfg=0 ctermbg=1
highlight DiffText ctermfg=15 ctermbg=0
"highlight DiffTextAdd ctermfg=15
highlight Statement ctermfg=2
highlight Pmenu ctermfg=7

" set up line numbering
set number
set relativenumber

" auto indent and tabsize
set ai
set tabstop=4
set shiftwidth=4
" set tabs to spaces for python files
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" whitespace
"set list
set nolist
"set listchars=eol:⏎,tab:>-,trail:.,space:.
"set listchars=eol:¶,tab:\\_,trail:·,space:·
"set listchars=eol:\¬,tab:\\_,trail:¨,space:¨
set listchars:eol:$,tab:\\_,trail:`,space:`

" show filename
set laststatus=2

" set wildmenu
set wildmenu

" map quickfix commands
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
