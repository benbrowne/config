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

imap <F4> <C-R>=strftime('%Y-%m-%d %H:%M')<CR>
nmap <F4> i<F4><Esc>
imap <F5> # <F4><CR># <Esc>
nmap <F5> i<F5>

vnoremap <F6> :s/\v^(\W*)(\w)/\1\u\2/e<CR> :'<,'>s/\v(\w)\s*$/\1./e<CR>

" vimplug. 
" Installed with curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim.
" Install packages with :PlugInstall
call plug#begin()
" linting
Plug 'dense-analysis/ale'
" autocompletion
Plug 'Valloric/YouCompleteMe'
" file system explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
