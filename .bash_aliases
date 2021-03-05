alias ls="ls -G"
alias gb="git rev-parse --abbrev-ref HEAD"
alias gcb="git checkout -b"
alias gpuoh="git push -u origin HEAD"
alias tsheets="git reflog --after '60 days ago' --format='%ad  %s' --date=format:%Y-%m-%d --author=ben | sort -r"

# Provide user with a menu of git branches with a case-insensitive match to a string then checkout the selection.
function greckout() {
    branches=`git branch | grep -i $1`
    branches=${branches//\*/}

    select branch in $branches;
    do
    git checkout $branch
    break
    done
}

