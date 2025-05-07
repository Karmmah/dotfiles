"colorscheme slate
"colorscheme morning
"colorscheme default

syntax on

" set up line numbering
set number
set relativenumber

" auto indent and tabsize
set ai
set tabstop=4
set shiftwidth=4

" whitespace
"set list
set nolist
"set listchars=eol:⏎,tab:>-,trail:.,space:.
"set listchars=eol:¶,tab:\\_,trail:¨,space:¨
"set listchars=eol:¶,tab:\\_,trail:·,space:·
set listchars:eol:$,tab:\\_,trail:`,space:`
"set listchars=eol:\¬,tab:\\_,trail:¯,space:¯
"set listchars=eol:\¬,tab:\\_,trail:¨,space:¨

" show filename
set laststatus=2

" set tabs to spaces for python files
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" set wildmenu
set wildmenu

" set accent coloring
highlight lineNr ctermfg=grey
highlight Search ctermfg=black
highlight MatchParen ctermfg=black
highlight MatchParen ctermbg=green
highlight Statement ctermfg=yellow
