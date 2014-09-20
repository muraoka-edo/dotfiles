# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# BitBucket
ssh-add -l >&/dev/null
if [ $? -ne 0 ]; then
    eval "$(ssh-agent)"
    ssh-add ~/.ssh/identity
fi

export LANG=ja_JP.UTF-8
#export LANG=C

# Shell Environment
set -o vi

# Setting for prompt
vcprompt_branch() {
    which vcprompt >/dev/null 2>&1 && vcprompt -f ' (%n:%b)'
}

ARCH=$(uname)
if [ "${ARCH}" = "Linux" ]; then
    [ -f "/etc/bash_completion.d/git" ] && . /etc/bash_completion.d/git
elif [ "${ARCH}" = "Darwin" ]; then
    [ -f /opt/local/share/bash-completion/completions/git ] && . /opt/local/share/bash-completion/completions/git
fi

if [ -f $BASH_COMPLETION_DIR/git ]; then
    git_branch=$(__git_ps1 '(git:%s)')
    export PS1="\[\033[01;36m\]\u@\h \$(git_branch)\$(vcprompt_branch)\[\033[0;32m\]\n\$ "
fi

# ex) http://qiita.com/note109/items/2adb71024d675bc43177
