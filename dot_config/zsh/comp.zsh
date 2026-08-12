fpath=($DOTZSH/comp $fpath)
autoload bashcompinit && bashcompinit
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

eval "$(workmux completions zsh)"
source <(maas-cmdr completion fzf)

# The maas-cmdr picker matches the literal command word on the line, and zsh
# doesn't expand aliases before completion — so swap the alias head for what it
# recognises, run it, then put the alias back.
typeset -gA _MC_ALIAS_HEADS=(
  mc  'maas-cmdr'
  mca 'maas-cmdr api'
  mci 'maas-cmdr api -i'
)
_mc_alias_tab() {
  local word=${${(z)LBUFFER}[1]} head=${_MC_ALIAS_HEADS[${${(z)LBUFFER}[1]}]}
  if [[ -z $head ]]; then
    zle _maas_cmdr_tab
    return
  fi
  LBUFFER="${head}${LBUFFER#$word}"
  zle _maas_cmdr_tab
  local ret=$?
  LBUFFER="${word}${LBUFFER#$head}"
  zle reset-prompt
  return $ret
}
zle -N _mc_alias_tab
bindkey '^I' _mc_alias_tab
