# Purpose
This repo stores all configurations that I want to be portable between systems. e.g.
- vim config and packages
- bash aliases
- etc

# To setup this repo in your home directory:
```bash
git init
git remote add origin git@github.com:benbrowne/config.git
git fetch
git reset --hard origin/master
```

# Then to install
e.g. installs vim packages and dependencies:
```bash
sudo ./setup.sh
```

