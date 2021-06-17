alias ls="ls -G"
alias gb="git rev-parse --abbrev-ref HEAD"
alias gcb="git checkout -b"
alias gpuoh="git push -u origin HEAD"
alias tsheets="git reflog --after '60 days ago' --format='%ad  %s' --date=format:%Y-%m-%d --author=ben | sort -r"
alias vlog='vi +$ -O ~/Dropbox/log.md ~/Dropbox/todo.md'
alias ldate="TZ="US/Pacific" date '+%Y-%m-%d %H:%M:%S'"
alias gcm='git commit -m'
alias gap='git add -p'

# Grep the insurance repo.
insgrep() {
    grep -rinE $1 --exclude-dir marvin --include=*{py,sh,yaml,yml} ~/insurance
}

insed() {
    grep -IrlE $1 --exclude-dir="marvin" --exclude-dir=".git" --include=*{py,sh,yaml,yml} ~/insurance | xargs sed -i "" "s/$1/$2/g"
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

# Use VIM mode
set -o vi
