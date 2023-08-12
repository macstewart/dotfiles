fpath=($DOTZSH/comp $fpath)
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

