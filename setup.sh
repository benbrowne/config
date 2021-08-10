# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --update-rc

echo 'installing vimplug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'installing vim plugins'
vi +'PlugInstall' +'qa'
echo 'installing rename'
apt install rename

# python module doq is a dependency for vim-pydocstring
pip install doq 

source .bash_aliases
