 
_dotfileLog "sourcing functions.zsh" 2>/dev/null

# my ip on the network
function ip() {
  ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  echo $ip
}

__wezterm_set_pane_var() {
  if hash base64 2>/dev/null ; then
    if [[ -z "${TMUX}" ]] ; then
      printf "\033]1337;SetUserVar=%s=%s\007" "$1" `echo -n "$2" | base64`
    else
      # <https://github.com/tmux/tmux/wiki/FAQ#what-is-the-passthrough-escape-sequence-and-how-do-i-use-it>
      # Note that you ALSO need to add "set -g allow-passthrough on" to your tmux.conf
      printf "\033Ptmux;\033\033]1337;SetUserVar=%s=%s\007\033\\" "$1" `echo -n "$2" | base64`
    fi
  fi
}

function addutil() {
    ln -sf $(pwd)/$1 ~/utils/$2
}

function listutils() {
    ls ~/utils
}

function re-source() {
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

alias ff='fv'

ft() {
    $@ $(rg --files | fzf)
}

fdt() {
    $@ $(rg --type d -E $FCD_EXCLUDE_DIRS | fzf --header "[$@ <dir>]")
}

export FCD_EXCLUDE_DIRS="Library .m2"

fcd() {
    cd $(fd --type d -E $FCD_EXCLUDE_DIRS | fzf --header "[cd <dir>]")
}
# use silver-searcher to search for file names (respects .agignore!)
#function agf() {
#  ag $2 -l -g $1
#}
alias agf='ag -l -g'

function nreload() {
    nvim -E -c PlugInstall -c qall
    # vim needs to restart and run UpdateRemotePlugins
    nvim -E -c UpdateRemotePlugins -c qall
}

function killonport() {
    lsof -ti tcp:"$@" -sTCP:LISTEN | xargs kill
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

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
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

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
    local tmpFile="${@%/}.tar";
    tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

    size=$(
    stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
    stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
    );

    local cmd="";
    if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
        # the .tar file is smaller than 50 MB and Zopfli is available; use it
        cmd="zopfli";
    else
        if hash pigz 2> /dev/null; then
            cmd="pigz";
        else
            cmd="gzip";
        fi;
    fi;

    echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
    "${cmd}" -v "${tmpFile}" || return 1;
    [ -f "${tmpFile}" ] && rm "${tmpFile}";

    zippedSize=$(
    stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
    stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
    );

    echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
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

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l json;
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
    MAVEN_OPTS="-agentpath:/Applications/VisualVM.app/Contents/Resources/visualvm/visualvm/lib/deployed/jdk16/mac/libprofilerinterface.jnilib=/Applications/VisualVM.app/Contents/Resources/visualvm/visualvm/lib,5140" mvn test -Dpmd.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true -Dtest=$1
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

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
