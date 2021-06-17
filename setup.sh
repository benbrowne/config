# Install vim 8.2 for COC compatibility
add-apt-repository ppa:jonathonf/vim -y
apt update
apt install vim -y

# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --update-rc

echo 'installing vimplug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'installing Nodejs for COC-pyright'
curl -sL install-node.now.sh/lts | bash -s -- -f
echo 'installing vim plugins'
vi +'PlugInstall' +'qa'
echo 'installing COC-pyright'
printf '\n' | vi +'CocInstall coc-pyright' +'qa'

# python module doq is a dependency for vim-pydocstring
pip install doq 

source .bash_aliases
