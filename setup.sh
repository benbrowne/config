# Fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --update-rc

echo 'installing vimplug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'installing vim plugins'
vi +'PlugInstall' +'qa'
echo 'installing rename'
apt install rename
echo 'installing ag'
apt install silversearcher-ag

# python module doq is a dependency for vim-pydocstring
pip install doq 

# Prefer to pdb for debugging.
pip install ipdb

source .bash_aliases

# Use insurance as the working directory.
cd insurance

# Open a split-pane tmux session.
tmux new-session -d
tmux split-window -h 'vim'
tmux -2 attach-session -d

