# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --update-rc

# Neovim
apt-get update
add-apt-repository -y ppa:neovim-ppa/stable
apt-get update
apt install -y neovim

# aliases maps vi to nvim so must come after neovim install.
source .bash_aliases

echo 'installing vimplug'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo 'installing Nodejs for COC-pyright'
curl -sL install-node.now.sh/lts | bash -s -- -f
echo 'installing vim plugins'
nvim +'PlugInstall' +'CocInstall -sync coc-pyright coc-sql coc-yaml' # CocInstalls don't work with +'qall'
echo 'installing rename'
apt install rename
echo 'installing ag'
apt install silversearcher-ag

# autoformatting
pip install autopep8

# Linting
pip install flake8

# python module doq is a dependency for vim-pydocstring
pip install doq 

# Prefer to pdb for debugging.
pip install ipdb

