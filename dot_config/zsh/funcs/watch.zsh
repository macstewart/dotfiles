
function watchsec() {
    ## watch with arg 1 and pass the rest as the command
    watch -n $1 ${@:2}
}
alias w=watchsec

function repeatsec() {
    interval=$1
    iter=0
    while true; do
        iter=$((iter+1))
        ts=$(gdate +%s%N)
        echo -n "($iter) "
        ${@:2}
        echo "took $((($(gdate +%s%N) - $ts)/1000000)) ms"
        sleep $interval
    done
}
alias r=repeatsec
