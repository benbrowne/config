# Install vim 8.2 for COC compatibility
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim 

echo 'installing vimplug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'installing Nodejs for COC-pyright'
curl -sL install-node.now.sh/lts | bash
echo 'installing vim plugins'
vi -c ':PlugInstall'  
echo 'installing COC-pyright'
vi -c ':CocInstall coc-pyright' 

# python module doq is a dependency for vim-pydocstring
pip install doq 
