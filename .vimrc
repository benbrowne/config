set number " line numbering.
syntax on " syntax highlighting.
set path=$PWD/**
set background=dark
colorscheme ron
inoremap jk <Esc>
set viminfo='100,<1000,s1000,h " Increase max size of registers

" Spacing
set tabstop=2       " Display a \t as 4 columns wide.
set softtabstop=2   " Backspace goes back 4 columns of whitespace.
set shiftwidth=2    " Indents will have a width of 4.
set expandtab       " Expand TABs to spaces.
set autoindent      " New line starts from previous indentation.
autocmd Filetype python setlocal ts=4 sw=4 sts=4

" Key mappings
autocmd FileType markdown imap <buffer> <F4> <C-R>=strftime('%Y-%m-%d %H:%M')<CR>
autocmd FileType markdown nmap <buffer> <F4> i<F4><Esc>
autocmd FileType markdown imap <buffer> <F5> # <F4><CR># <Esc>
autocmd FileType markdown nmap <buffer> <F5> i<F5>

autocmd FileType python imap <buffer> <F4> import ipdb; ipdb.set_trace()<CR>
autocmd FileType python nmap <buffer> <F4> i<F4>

" Capitalize line starts and add periods to line ends.
vnoremap <F6> :s/\v^(\W*)(\w)/\1\u\2/e<CR> :'<,'>s/\v(\w)\s*$/\1./e<CR>

" View the unsaved changes
command Diff execute ":w !diff % -"
