_dotfileLog "sourcing config.zsh" 2>/dev/null

export VI_MODE_SET_CURSOR=true
HYPHEN_INSENSITIVE="true"
export CASE_SENSITIVE="false"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt appendhistory

KEYTIMEOUT=10
setopt menu_complete
setopt no_list_ambiguous
setopt extended_glob

autoload -U edit-command-line
zle -N edit-command-line

source $DOTZSH/_export/fzf.zsh
source $DOTZSH/_export/nnn.zsh

