
function millis() {
    if [[ $# -eq 0 ]]; then
        epoch --ms
    else
        epoch --ms --dt $@
    fi
}
alias ,ms=millis

function millisc() {
    # call ms with all args, send to clipboard and stdout. strip trailing newline from pbcopy
    millis $@ | tee >( tr -d '\n' | pbcopy)
}
alias ,msc=millisc

function seconds() {
    if [[ $# -eq 0 ]]; then
        epoch
    else
        epoch --dt $@
    fi
}
alias ,sec=seconds

function secondsc() {
    seconds $@ | tee >( tr -d '\n' | pbcopy)
}
alias ,secc=seconds

function utc {
    if [[ $# -eq 0 ]]; then
        epoch $(seconds)
    else
        epoch $(seconds --dt $@)
    fi
}
alias ,utc=utc

function utcc {
    utc $@ | tee >( tr -d '\n' | pbcopy)
}
alias ,utcc=utcc
