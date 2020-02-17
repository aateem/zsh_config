# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

autoload -Uz promptinit
promptinit

autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
# may potentially be slow (depending on the repo size)
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats \
    '%F{19}[%f%F{16}%b%f%F{19}]%f%F{9}%u%f%F{10}'
zstyle ':vcs_info:git:*' actionformats \
    '%F{19}[%f%F{16}%b%f%F{19}|%f%F{17}%a%f%F{19}]%f%F{9}%u%f%F{10}'

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/fuzzy_finder/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias ll='ls -lah'

setopt PROMPT_SUBST

precmd () { vcs_info }

PS1='%F{8}%n%f %F{12}%2~%f %F{11}%#_>%f '
RPS1='${vcs_info_msg_0_}'

export PATH=$PATH:~/bin/
