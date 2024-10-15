# Fuzzy finder
echo 'installing fzf (fuzzy finder)'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --update-rc

# Neovim
echo 'installing Neovim'
dnf update
add-dnf-repository -y ppa:neovim-ppa/stable
dnf update
dnf install -y neovim

# aliases maps vi to nvim so must come after neovim install
sudo -u ben source ~/.bash_aliases

# Vim Plug installation
echo 'installing vim-plug'
sudo -u ben sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Node.js
echo 'installing Node.js for COC-pyright'
curl -sL install-node.now.sh/lts | bash -s -- -f

# Installing vim plugins as user 'ben'
echo 'installing vim plugins'
sudo -u ben nvim +'PlugInstall' +'CocInstall -sync coc-pyright coc-sql coc-yaml' +qall

# System packages (rename and ag)
echo 'installing rename'
dnf install -y rename

echo 'installing ag'
dnf install -y silversearcher-ag

dnf install pip

# Python tools
echo 'installing Python packages'
pip install autopep8 flake8 doq ipdb

