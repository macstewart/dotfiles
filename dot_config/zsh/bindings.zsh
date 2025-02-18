zle -N edit-command-line

bindkey -r '^J'

bindkey "^t" jq-complete

# bindkey -M vicmd v edit-command-line

bindkey -M vicmd q edit-command-line

bindkey -M vicmd "^r" atuin-search

bindkey -M viins "^r" atuin-search

bindkey -M main "^r" atuin-search

bindkey "^r" atuin-search

# ctrl + shift + e
bindkey "^E" __llm_cmdcomp
