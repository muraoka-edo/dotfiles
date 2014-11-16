# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#export LANG=C
export LANG=ja_JP.UTF-8

# Shell Environment
set -o vi

# GitHub/BitBucket
ssh-add -l >&/dev/null
if [ $? -ne 0 ]; then
    eval "$(ssh-agent)"
    ssh-add ~/.ssh/identity
fi

# Ruby
if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
elif [ -d "/opt/rbenv/shims/ruby" ]; then
  export PATH="/opt/rbenv/shims/ruby:$PATH"
  eval "$(rbenv init -)"
fi

# PS1(git)
# - Install
# cd ~/dotfiles/.bash.d; pwd
#$ wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
# $ wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
BASH_COMPLETION_DIR="$HOME/dotfiles/.bash.d"
  . ${BASH_COMPLETION_DIR}/git-prompt.sh
  . ${BASH_COMPLETION_DIR}/git-completion.bash

export PS1='[\[\033[36m\]\u\[\033[0;37m\]@\h\[\033[00m\]:\[\033[37m\]\w\[\033[36m\]$(__git_ps1)\[\033[00m\]]\n\$ '

