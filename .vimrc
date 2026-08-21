syntax on

"set termguicolors
"colorscheme default

" SET ACCENT COLORING
highlight lineNr ctermfg=7
highlight MatchParen ctermfg=15
highlight DiffAdd ctermfg=15
highlight DiffChange ctermfg=11 ctermbg=0
highlight DiffDelete ctermfg=0 ctermbg=1
highlight DiffText ctermfg=15 ctermbg=0
highlight Pmenu ctermfg=3 ctermbg=0
highlight Statement ctermfg=2
highlight ErrorMsg ctermbg=9

" SET UP LINE NUMBERING
set number
set relativenumber

" AUTO INDENT AND TABSIZE
set ai
set tabstop=4
set shiftwidth=4
" set tabs to spaces for python files
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" WHITESPACE
set nolist
"set list
"set listchars=eol:⏎,tab:>-,trail:.,space:.
"set listchars=eol:¶,tab:\\_,trail:·,space:·
"set listchars=eol:\¬,tab:\\_,trail:¨,space:¨
"set listchars:eol:$,tab:\\_,trail:`,space:`
"set listchars:eol:§,tab:__/,trail:`,space:`
"set listchars:eol:§,tab:__/,space:·
"set listchars:eol:§,tab:==>,space:·
"set listchars:eol:↩,tab:__/,space:‿
"set listchars:eol:↲,tab:__/,space:߸
"set listchars:eol:↲,tab:==>,space:·
"set listchars:eol:↩,tab:__/,space:߸
"set listchars:eol:↲,tab:__/,space:‸
"set listchars:eol:↲,tab:__/,space:⁔
set listchars:eol:↩,tab:-->,space:⁔

" SHOW FILENAME
set laststatus=2

" SET WILDMENU
set wildmenu

" MAP QUICKFIX COMMANDS
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
