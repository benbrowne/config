echo 'sourcing .bash_aliases'
alias ls="ls -G"
alias gb="git rev-parse --abbrev-ref HEAD"
alias gcb="git checkout -b"
alias gpuoh="git push -u origin HEAD"
alias grh="git reset --hard"
alias gcm='git commit -m'
alias gap='git add -p'
alias gsu='git submodule update'
alias vlog='vi +$ ~/Dropbox/log.md'
alias ldate="TZ="US/Pacific" date '+%Y-%m-%d %H:%M:%S'"
alias vi=nvim

# Inline substitution within the current git repo.
gitsed() {
    sed -i  s/$1/$2/g $(git grep -l $1)
}

# Provide user with a menu of git branches with a case-insensitive match to a string then checkout the selection.
greckout() {
    branches=$(git for-each-ref --format='%(refname:short)' refs/heads/ | grep -i $1)
    select branch in $branches;
    do
    git checkout $branch
    break
    done
}

# Provide user with a menu of git branches for deletion.
delete_branches() {
    branches=$(git for-each-ref --format='%(refname:short)' refs/heads/)
    select branch in $branches;
    do
    git branch -D $branch
    done
}


# Log memory consumption over time in a machine readable format to 'memory_log.txt'
memory_log() {
  echo "      date     time $(free -m | grep total | sed -E 's/^    (.*)/\1/g')" >> memory_log.txt
  while true; do
      echo "$(date '+%Y-%m-%d %H:%M:%S') $(free -m | grep Mem: | sed 's/Mem://g')" >> memory_log.txt
          sleep 1
        done
}

# Use VIM mode.
set -o vi
# Use jk to enter normal mode at the command line. 
bind '"jk":vi-movement-mode'
