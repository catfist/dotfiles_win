#!/bin/bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Include splited source
source $HOME/.bash/alias-init.bash
source $HOME/.bash/function-init.bash
while read i; do
    source $i
done < <(find $HOME/.bash/modules/ -name "*.bash")

# Shell Options
#
# See man bash for more options...
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f /usr/share/git/completion/git-completion.bash ]] && . /usr/share/git/completion/git-completion.bash
[[ -f /usr/share/git/completion/git-prompt.sh ]] && . /usr/share/git/completion/git-prompt.sh

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# TITLE / PROMPT
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'

GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\n\[\033[1;34m\]$MSYSTEM \[\033[0;32m\]\s \[\033[0;33m\][\w]\[\033[0;31m\]$(__git_ps1) \[\033[1;35m\]\t\[\033[0;35m\]\n\$\[\033[0m\] '
# シングルクォーテーションで囲まないとgit_ps1が更新されない。ただし、構文エラーが出るので暫定的にダブルクォーテーションにしておく。
export PS1="\n\[\033[1;34m\]$MSYSTEM \[\033[0;32m\]\s \[\033[0;33m\][\w] \[\033[1;35m\]\t\[\033[0;35m\]$(__git_ps1)\n\$\[\033[0m\] "

export EDITOR=nano
export dropbox="/c/Users/MM/Dropbox"

