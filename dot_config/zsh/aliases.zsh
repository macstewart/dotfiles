alias nnn='nnn -e -x'

alias cat='bat'

alias vi="nvim"
alias vim="nvim"
alias vv="nvim ."
alias vr="nvim -c 'Telescope oldfiles'"

alias cd='cd -P'

alias ld='lazydocker'
alias lg='lazygit'

alias dc='docker compose'
alias dcupdate='docker compose pull && docker compose up --force-recreate --build -d && docker image prune -f'

alias gs='git status'
alias gd='git diff | diff-so-fancy'
alias gp='git push'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gam='git commit -am "this will be squashed anyway"'

# alias mci='qmvn clean install $@'
alias msb='qmvn spring-boot:run $@'

alias mc='maas-cmdr'
alias mca='maas-cmdr api'
alias mci='maas-cmdr api -i'

alias jm='jira issue list -q"filter=\"Solace Cloud Current User\""'

alias xpv='xargs -I{} reversepv $@ {}'

alias t='tmux'
alias ta='tmux attach'
alias ts='tmux-sessionizer'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dot='chezmoi'

alias s='suck'
alias b='blow'

alias sdb="export MYSQL_PWD=$SERVITOR_DB_PASS; mysql -h$SERVITOR_HOST -u$SERVITOR_DB_USER"
alias db="export MYSQL_PWD=$LOCAL_DB_PASS; mysql -h$LOCAL_DB_HOST -u$LOCAL_DB_USER"
alias dbe="noglob localdbe"
alias sdbe="noglob servitordbe"
alias dbc="setdb"
# alias sdb="export MYSQL_PWD=$SERVITOR_DB_PASS; mysqlsh --host $SERVITOR_HOST --user $SERVITOR_DB_USER"
alias kauth="source ,awsAuth"
alias k="kubectl"

alias z="zed"

