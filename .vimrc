set number " line numbering.
syntax on " syntax highlighting.
set path=$PWD/**
inoremap jk <Esc>
set viminfo='100,<1000,s1000,h " Increase max size of registers

" Spacing
set tabstop=2       " Display a \t as 4 columns wide.
set softtabstop=2   " Backspace goes back 4 columns of whitespace.
set shiftwidth=2    " Indents will have a width of 4.
set expandtab       " Expand TABs to spaces.
set autoindent      " New line starts from previous indentation.
autocmd Filetype python setlocal ts=4 sw=4 sts=4
