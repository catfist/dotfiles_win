#!/bin/bash

# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# ~/.bash_profile: executed by bash(1) for login shells.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the msys2 mailing list.

# User dependent .bash_profile file

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi
export GOPATH=$HOME/.go
if [ -d "$GOPATH/bin" ]; then
  PATH="$GOPATH/bin:$PATH"
fi


###################
# Add PATH
A_PATH=(/c/ProgramData/chocolatey/bin /usr/bin $HOME/bin /mingw64/bin)
for V_PATH in ${A_PATH[@]}; do
  if ! echo "$PATH" | grep -Eq ":?$V_PATH:?"; then
      echo "add $V_PATH to \$PATH"
      export PATH="$V_PATH:$PATH"
  fi
done
# Convert Windows path to Unix path in inherited EnvVar
USERPROFILE=$(cygpath -u $USERPROFILE)

# if ! echo "$PATH" | grep -Eq ':?/usr/bin:?'; then
#     echo 'add /usr/bin to $PATH'
#     export PATH="$PATH:/usr/bin"
# fi
# if ! echo "$PATH" | grep -Eq ':?PATH="/c/ProgramData/chocolatey/bin:?'; then
#     echo 'add /c/ProgramData/chocolatey/bin: to $PATH'
#     export PATH="/c/ProgramData/chocolatey/bin:$PATH"
# fi


# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi
