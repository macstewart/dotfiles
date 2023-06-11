_dotfileLog "sourcing config.zsh" 2>/dev/null

export VI_MODE_SET_CURSOR=true
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
KEYTIMEOUT=10
setopt menu_complete
setopt no_list_ambiguous

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

source $DOTZSH/_export/fzf.zsh
source $DOTZSH/_export/nnn.zsh
