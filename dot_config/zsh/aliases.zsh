alias nnn='nnn -e -x'

alias cat='bat'

alias vi="nvim"
alias vim="nvim"
alias vv="nvim ."

alias cd='cd -P'

alias gs='git status'
alias gd='git diff | diff-so-fancy'
alias gp='git push'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gam='git commit -am "this will be squashed anyway"'

alias mci='qmvn clean install $@'
alias msb='qmvn spring-boot:run $@'

alias jm='jira issue list -q"filter=\"Solace Cloud Current User\""'

alias xpv='xargs -I{} reversepv $@ {}'

alias t='tmux'
alias ta='tmux attach'
alias ts='tmux new -s'
alias tls='tmux ls'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dot='chezmoi'

alias s='suck'
alias b='blow'
