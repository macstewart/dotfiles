zle -N edit-command-line

bindkey -r '^d'

bindkey "^t" jq-complete

# bindkey -M vicmd v edit-command-line

bindkey -M vicmd q edit-command-line

bindkey -M vicmd "^r" atuin-search

bindkey -M viins "^r" atuin-search

bindkey -M main "^r" atuin-search

bindkey "^r" atuin-search

# ctrl + shift + e
bindkey "^E" __llm_cmdcomp

function run-tmux-copy-up { 'tcopy'; zle redisplay; }
zle -N run-tmux-copy-up
bindkey -M vicmd "^u" run-tmux-copy-up
bindkey -M viins "^u" run-tmux-copy-up
bindkey -M main "^u" run-tmux-copy-up
bindkey "^u" run-tmux-copy-up
# bindkey '^f' run-tmux-sessionizer
# ctrl + u - enter tmux copy mode and scroll up once
# bind -M vicmd "^u" 'tmux copy-mode'
# bindkey -M viins "^u" tmux copy-mode
