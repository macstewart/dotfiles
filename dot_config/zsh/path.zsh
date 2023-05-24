
function addToPath() {
    case ":$PATH" in
        *":$1"*) :;; #already there
        *) export PATH="$1:$PATH"; echo "adding $1 to path";; #adding to path
    esac
}

pathadditions=(
    /usr/local/{bin,sbin}
    $HOME/utils
    $HOME/.config/yarn/global/node_modules/.bin
    $HOME/.config/utils
    $HOME/.cargo/bin
    $HOME/go/bin
    $HOME/.local/bin
)

for i in ${pathadditions[@]}; do addToPath $i; done
