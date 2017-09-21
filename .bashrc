# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

force_color_prompt=yes
PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"
eval "$(dircolors /home/bmastay/.dir_colors/dircolors-solarized/dircolors.ansi-dark)"
# User specific aliases and functions

alias ls='ls -hF --color=tty'
alias la='ls -A'
alias ll='ls -l'

alias cdhost="cd ~/Perforce/bmastay_boss-build-server_6723/AWS/projects/BOSS/trunk/host/"
alias cdsrc="cd ~/Perforce/bmastay_boss-build-server_6723/AWS/projects/BOSS/trunk/host/src/"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/lib
export PATH=$HOME/bin:$PATH
