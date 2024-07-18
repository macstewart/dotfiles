 
_dotfileLog "sourcing functions.zsh" 2>/dev/null

# my ip on the network
function ip() {
  ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  echo $ip
}

function addutil() {
    ln -sf $(pwd)/$1 ~/utils/$2
}

function listutils() {
    ls ~/utils
}

function zvm_after_lazy_keybindings() {
    source $DOTZSH/bindings.zsh
}

function zvm_after_init_commands() {
    source $DOTZSH/bindings.zsh
}

function localdbe() {
    echo $@
    export MYSQL_USER=$LOCAL_DB_USER
    export MYSQL_PWD=$LOCAL_DB_PASS
    export MYSQL_HOST=$LOCAL_DB_HOST
    mysqle "$*"
}

function servitordbe() {
    export MYSQL_USER=$SERVITOR_DB_USER
    export MYSQL_PWD=$SERVITOR_DB_PASS
    export MYSQL_HOST=$SERVITOR_HOST
    mysqle "$@"
}

function mysqle() {
    mysql $DB_NAME -e "$@" --json
}

function setdb() {
    dbdb=$(mysql -e 'show databases' | fzf)
    if [ -n "$dbdb" ]; then
        export DB_NAME=$dbdb
    else
        unset DB_NAME
    fi
}
# function jq-repl () {
#   local query_file data_file new_pane_height nodemon_cmd change_aucmd jq_args
#
#   # store input in file
#   query_file=$(mktemp)
#   data_file=${query_file}.json
#   cat /dev/stdin > $data_file
#   new_pane_height=5
#
#   # pass args to jq
#   jq_args="$@ -C -f $query_file $data_file" 
#   nodemon_cmd="clear; jq $jq_args"
#
#   # inject autocommand into vim, saving file on each edit, triggering nodemon, which 
#   # runs jq the corresponding jq command
#   change_aucmd="au TextChanged,TextChangedI <buffer> write"
#   tmux split-window -l$new_pane_height vim -c "$change_aucmd" -c "set ft=jq" $query_file
#   nodemon -q -d 0.3 -w $query_file -x "$nodemon_cmd"
# }

function re() {
    if [ $# -gt 0 ]; then # assume arg is debug flag, TODO don't do this
        export DEBUG=1
        cflag="--debug"
    else
        export DEBUG=0
    fi
    chezmoi apply $cflag
    source ~/.zprofile
    exec zsh -l
}

function usej() {
    echo 'setting java home to ' + `/usr/libexec/java_home -v $1`
    export JAVA_HOME=`/usr/libexec/java_home -v $1`
}

function fv() {
    v $(rg --files | fzf)
}

function pbs() {
    echo "sucking from clipboard" >&2
    pbpaste | suck "$@" 
}

function pbb() {
    echo "blowing to clipboard" >&2
    blow "$@" | pbcopy
}

function bv() {
    filename=$(blow -p "$@")
    echo "opening $filename in nvim"
    v $filename
}

alias ff='fv'

ft() {
    $@ $(rg --files | fzf)
}

fdt() {
    $@ $(rg --type d -E $FCD_EXCLUDE_DIRS | fzf --header "[$@ <dir>]")
}

export FCD_EXCLUDE_DIRS="Library .m2"

fcd() {
    cd "$(fd --type d -E $FCD_EXCLUDE_DIRS | fzf --header '[cd <dir>]')"
}

function cd() {
    builtin cd "$@";
    tree -aC -L 1 -I '.git|node_modules' --dirsfirst . 
}

function v() {
    if [ $# -eq 0 ]; then
        nvim;
    else
        nvim "$@";
    fi;
}

function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# Create a new directory and enter it
function mcd() {
    mkdir -p "$@" && cd "$_";
}

# alias l is created by zpresto
unalias l 2>/dev/null
unalias ll 2>/dev/null
function l() {
    tree -aC -L 1 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function ll() {
    tree -aC -L 2 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function lll() {
    tree -aC -L 3 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function llll() {
    tree -aC -L 4 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}
function lllll() {
    tree -aC -L 5 -I '.git|node_modules' --dirsfirst "$@" | less -FRNX;
}

function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}

qmvn() {
    echo "running: mvn $@ -DskipTests -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true" 
    mvn $@ -DskipTests -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true 
}

qmvntest() {
    # if ! [ -f $1 ]; then
    # echo "requires test class or method"
    # return
    # fi;
    echo "running: mvn test -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true -Dtest=$1" 
    # MAVEN_OPTS="-agentpath:/Applications/VisualVM.app/Contents/Resources/visualvm/visualvm/lib/deployed/jdk16/mac/libprofilerinterface.jnilib=/Applications/VisualVM.app/Contents/Resources/visualvm/visualvm/lib,5140" 
    mvn test -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true -Dtest=$1
}

testff() {
    echo "blah"
}

qmvntestall() {
    # if ! [ -f $1 ]; then
    # echo "requires test class or method"
    # return
    # fi;
    echo "running: mvn test -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true" 
    mvn test -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true
}

i() {
    read pipein
    print -z $pipein
}

_dotfileLog() {
    if [[ $DEBUG == 1 ]]; then
        echo $1
    fi
}
