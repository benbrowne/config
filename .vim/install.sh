# Instal vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Nodejs for COC-pyright
curl -sL install-node.now.sh/lts | bash
# COC-pyright
vi -c ':PlugInstall' -c ':CocInstall coc-pyright' -c 'xa' 
# python module doq is a dependency for vim-pydocstring
pip install doq
brew install fzf
