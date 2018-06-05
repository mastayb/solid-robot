# .bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

force_color_prompt=yes
PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"

eval "$(dircolors /home/parallels/.dir_colors/dircolors)"

alias ls='ls -hF --color=tty'
alias la='ls -A'
alias ll='ls -l'

alias python='python3'

set -o vi

source /opt/ros/kinetic/setup.bash
if [ -f /home/parallels/catkin_ws/devel/setup.bash ]; then
   source /home/parallels/catkin_ws/devel/setup.bash
fi

