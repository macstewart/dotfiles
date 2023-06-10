echo "running zexports"

export BREWPATH=$(which brew)
export SUCKDIR="$HOME/suck"

if ! [[ -v JHOME ]]; then
    export JHOME=/usr/libexec/java_home
fi

export MAASDIR="$HOME/github/solacedev"
export JAVA_HOME=$($JHOME -v 11.0.12)
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export VISUAL=nvim
export EDITOR="$VISUAL"

export LESS_TERMCAP_md="${yellow}";

export MANPAGER='less -X';

if [[ -z "${TMPDIR}" ]]; then
  export TMPDIR="/tmp/zsh-${UID}"
fi

if [[ -f "$HOME/.env" ]]; then
    source "$HOME/.env"
fi

