#!/bin/bash
# msys2環境だと起動時に定義されるエイリアスがあるかもしれないのでやめとく
# unalias -a  # all clear

#########################
# aliaes
#########################

# cd系
alias cddb="cd $USERPROFILE/Dropbox/"
alias cdnt="cd $USERPROFILE/Dropbox/Notes"

# bash操作
alias sl="exec $SHELL -l" # shell login
alias s="source ~/.bashrc" # source (.bashrc)
alias sp="source ~/.bash_profile" # source (.bash_profile)

# snippet
alias downlist="ls -tr /c/down | tail -n 10"
  alias dlls=downlist
  alias dnls=downlist
alias echopath='echo "$PATH" | tr ":" "\n"'
  alias epath=echopath

# default options for commands/programs
alias sentaku='sentaku -s "line"'
alias fra="fr -a"

# apps
# alias oedit="/c/apps/oedit/oedit.exe"

# commands
alias open="explorer" # [fix] 末尾`\`のフォルダパスを認識できない
alias where="type -p" # whereコマンドだとWindows Pathを出してくるので

# other
