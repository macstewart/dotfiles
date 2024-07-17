#https://github.com/mattmc3/zsh_unplugged#jigsaw-the-humble-plugin-load-function
#

function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

_dotfileLog "sourcing plugins.zsh" 2>/dev/null

ZPLUGINDIR=$HOME/.zsh/plugins

repos=(
    zsh-users/zsh-completions
    Aloxaf/fzf-tab
    jeffreytse/zsh-vi-mode
    reegnz/jq-zsh-plugin
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-autosuggestions
)

source $DOTZSH/plugconf.zsh

# now load your plugins
plugin-load $repos

bindkey -M viins -r "^R"
bindkey -r "^R"
bindkey -M viins -r "^R"

eval "$(atuin init zsh)"
