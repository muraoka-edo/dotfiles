# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#export LANG=C
export LANG=ja_JP.UTF-8

# bash.d
BASHD="$HOME/dotfiles/.bash.d"

# Shell Environment
set -o vi

# Alias
alias vi=$(which vim)
alias grep='grep --color'

# GitHub/BitBucket
ssh-add -l >&/dev/null
if [ $? -ne 0 ]; then
    eval "$(ssh-agent)"
    ssh-add ~/.ssh/identity
fi

# Ruby
if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
elif [ -d "/opt/rbenv/shims/ruby" ]; then
  export PATH="/opt/rbenv/shims:$PATH"
  eval "$(rbenv init -)"
fi

# Pyton
if [ -d "$HOME/.pyenv/shims" ]; then
  export PATH="$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
elif [ -d "/opt/pyenv/shims/python" ]; then
  export PATH="/opt/pyenv/shims:$PATH"
  eval "$(pyenv init -)"
fi

# PS1(git)
# - Install
# cd ~/dotfiles/.bash.d; pwd
#$ wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
# $ wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
. ${BASHD}/git-prompt.sh
. ${BASHD}/git-completion.bash

# http://hocuspokus.net/2009/07/add-git-and-svn-branch-to-bash-prompt/
parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
}
parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}

# Prompt
PS1='[\[\033[36m\]\u\[\033[0;37m\]@\h\[\033[00m\]:\[\033[37m\]\w\[\033[36m\]$(__git_ps1)$(parse_svn_branch)\[\033[00m\]]\n\$ '

# is_mac?
ARCH=$(uname)
if [ "$ARCH" = "Darwin" ]; then
  . ${BASHD}/mac_env
fi
