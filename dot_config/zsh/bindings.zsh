zle -N edit-command-line

bindkey -r '^J'

bindkey "^t" jq-complete

bindkey -M vicmd v edit-command-line

bindkey -M vicmd q edit-command-line
