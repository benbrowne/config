set number " line numbering.
syntax on " syntax highlighting.
set tabstop=4       " Display a \t as 4 columns wide.
set softtabstop=4   " Backspace goes back 4 columns of whitespace.
set shiftwidth=4    " Indents will have a width of 4.
set expandtab       " Expand TABs to spaces.
set autoindent      " New line starts from previous indentation.
set path=$PWD/**
inoremap jk <Esc>
set viminfo='100,<1000,s1000,h " Increase max size of registers

imap <F4> <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
nmap <F4> i<F4><Esc>
imap <F5> <h1><F4></h1>
nmap <F5> i<F5><Esc>
