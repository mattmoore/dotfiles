# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Bundler
alias be="bundle exec"

# GO
source $HOME/.gvm/scripts/gvm
## GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH

# Scripts
export SCRIPTPATH=$HOME/source/scripts
export PATH=$PATH:$SCRIPTPATH
