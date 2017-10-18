# .bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#force_color_prompt=yes
#PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"

#eval "$(dircolors _path_to_dir_colors)"

alias ls='ls -hF --color=tty'
alias la='ls -A'
alias ll='ls -l'

alias python='python3'
