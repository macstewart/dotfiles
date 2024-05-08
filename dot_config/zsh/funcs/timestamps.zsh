
function est() {
    date -r $(($1 / 1000))
}

function utc() {
    date '+%Y-%m-%dT%H:%M:%SZ' -u -r $(($1 / 1000))
}

function timediff() {
    nowMillis=$(gdate +%s%3N)
    targetMillis=$1
    if [ -z "$targetMillis" ]; then
        echo "usage: timediff <epochMillis>"
        return
    fi
    # if it's an iso date, convert to epoch millis
    if [[ $targetMillis == *"T"* ]]; then
        targetMillis=$(isoToEpoch $targetMillis)
    fi
    echo $((($nowMillis - $targetMillis) / 1000 / 60)) minutes
}

function epochDuration() {
    local T=$1/1000
    local D=$((T/60/60/24))
    local H=$((T/60/60%24))
    local M=$((T/60%60))
    local S=$((T%60))
    printf '%dd%02dh%02dm%02ds\n' $D $H $M $S
}

function isoToEpoch() {
    date -j -f "%Y-%m-%dT%H:%M:%SZ" $1 +%s%3N
}

