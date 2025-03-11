"colorscheme slate
"colorscheme morning
"colorscheme default

" set up line numbering
set number
set relativenumber

" auto indent and tabsize
set ai
set tabstop=4
set shiftwidth=4

" whitespace
set list
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

