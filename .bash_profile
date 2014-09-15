# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# export LANG=ja_JP.UTF-8
export LANG=C

# Shell Environment
set -o vi

# Setting for prompt
vcprompt_branch() {
    which vcprompt >/dev/null 2>&1 && vcprompt -f ' (%n:%b)'
}

git_branch() {
    __git_ps1 '(git:%s)'
}

if [ -f $BASH_COMPLETION_DIR/git ]; then
    . /opt/local/share/git-core/git-prompt.sh
    PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \$(git_branch)\$(vcprompt_branch)\[\033[0;32m\]\w\[\033[0;37m\]]\n\$ "
else
    PS1='\[\033[01;32m\]\w\[\033[00m\]\[\033[01;36m\]$(vcprompt_branch)\[\033[00m\]\n\u@\h\$ '
fi

export PS1
