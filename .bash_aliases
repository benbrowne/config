echo 'sourcing .bash_aliases'
alias ls="ls -G"
alias gb="git rev-parse --abbrev-ref HEAD"
alias gcb="git checkout -b"
alias gpuoh="git push -u origin HEAD"
alias grh="git reset --hard"
alias gcm='git commit -m'
alias gap='git add -p'
alias gsu='git submodule update'
alias ldate="TZ="US/Pacific" date '+%Y-%m-%d %H:%M:%S'"
alias vi=nvim
alias log='vi ~/Dropbox/log.md'
alias todo='vi ~/Dropbox/todo.md'

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

# Quickly view a markdown file.
view() {
  # Check if a markdown file is provided
  if [ -z "$1" ]; then
    echo "Usage: convert_and_open_md <markdown_file>"
    return 1
  fi
  
  # Get the markdown file and generate the HTML file name
  md_file="$1"
  html_file="${md_file%.md}.html"
  
  # Convert the markdown file to HTML using pandoc
  pandoc "$md_file" -o "$html_file"
  
  # Check if the conversion was successful
  if [ ! -f "$html_file" ]; then
    echo "Error: Failed to generate HTML file."
    return 1
  fi

  # Open the HTML file using xdg-open
  xdg-open "$html_file"
  
  # Wait for a moment to allow the browser to open the file
  sleep 2
  
  # Remove the generated HTML file
  rm "$html_file"
  
  echo "HTML file opened and removed: $html_file"
}

# Use VIM mode.
set -o vi
# Use jk to enter normal mode at the command line. 
bind '"jk":vi-movement-mode'
