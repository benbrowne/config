# Install vim 8.2 for COC compatibility
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim 

# Install vimplug
echo 'installing vimplug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Nodejs for COC-pyright
echo 'installing COC-pyright'
curl -sL install-node.now.sh/lts | bash
# COC-pyright
echo 'installing vim plugins'
vi -c ':PlugInstall'  -c ':CocInstall coc-pyright' 
# python module doq is a dependency for vim-pydocstring
pip install doq 

