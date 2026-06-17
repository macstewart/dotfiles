zle -N edit-command-line

bindkey -r '^d'

bindkey "^t" jq-complete

# bindkey -M vicmd v edit-command-line

bindkey -M vicmd q edit-command-line

# ctrl + g - open the current prompt in nvim, in a tmux popup when inside tmux
edit-command-line-popup() {
  # ctrl+z in the editor saves & returns to the prompt; ctrl+shift+z saves &
  # runs the command immediately. nvim signals "run it" by touching this flag.
  local accept_flag="${TMPDIR:-/tmp}/zle-edit-accept.$$"
  command rm -f "$accept_flag"
  local send_map="<Cmd>write<Bar>call writefile([],\"$accept_flag\")<Bar>quitall!<CR>"
  local maps="-c 'nnoremap <C-S-z> $send_map' -c 'inoremap <C-S-z> <Esc>$send_map'"
  # <Tab>/<S-Tab>: filename completion; cycle the menu once it's open
  maps+=" -c 'inoremap <expr> <Tab> pumvisible() ? \"\\<C-n>\" : \"\\<C-x>\\<C-f>\"'"
  maps+=" -c 'inoremap <expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<C-x>\\<C-f>\"'"
  if [[ -n $TMUX ]]; then
    local geo
    geo=( ${(s: :)"$(tmux display -p '#{pane_left} #{pane_top} #{pane_width} #{pane_height} #{cursor_y}')"} )
    local pane_left=${geo[1]} pane_top=${geo[2]} pane_w=${geo[3]} pane_h=${geo[4]} cursor_y=${geo[5]}
    # open the popup in the pane's cwd so filename completion is relative to here
    local pane_path="$(tmux display -p '#{pane_current_path}')"
    # size the popup to the command's line count (min 3 edit lines), + 2 for the borders
    local -a blines
    blines=( "${(@f)PREBUFFER}${(@f)BUFFER}" )
    local want=$(( $#blines > 3 ? $#blines : 3 ))
    local h=$(( want + 2 ))
    (( h > pane_h )) && h=$pane_h
    # sit just below the prompt line, shifted right 2 cols to line up with the prompt text
    local x=$(( pane_left + 2 ))
    local w=$(( pane_w - 2 ))
    local y=$(( pane_top + cursor_y + 2 ))   # drop it so the first edit line lands on the ghost line
    # if it would run past the pane bottom, flip above the prompt (bottom on the prompt
    # line) instead of shrinking — keeps it full height and hugging the prompt
    if (( y + h > pane_top + pane_h )); then
      y=$(( pane_top + cursor_y ))   # at the bottom: anchor on the prompt row, let tmux fit
      (( y < pane_top )) && y=$pane_top
    fi
    local VISUAL="tmux display-popup -B -E -d '$pane_path' -x $x -y $y -w $w -h $h nvim -c 'set laststatus=0 cmdheight=0 norelativenumber | hi Normal guibg=#008080 | hi LineNr guibg=#008080' $maps"
  else
    local VISUAL="nvim $maps"
  fi
  edit-command-line
  if [[ -e $accept_flag ]]; then
    command rm -f "$accept_flag"
    zle accept-line
  fi
}
zle -N edit-command-line-popup
bindkey -M vicmd "^g" edit-command-line-popup
bindkey -M viins "^g" edit-command-line-popup
bindkey -M main "^g" edit-command-line-popup
bindkey "^g" edit-command-line-popup

bindkey -M vicmd "^r" atuin-search

bindkey -M viins "^r" atuin-search

bindkey -M main "^r" atuin-search

bindkey "^r" atuin-search

# ctrl + shift + e
bindkey "^E" __llm_cmdcomp

function run-tmux-copy-up { 'tcopy'; zle redisplay; }
zle -N run-tmux-copy-up
bindkey -M vicmd "^u" run-tmux-copy-up
bindkey -M viins "^u" run-tmux-copy-up
bindkey -M main "^u" run-tmux-copy-up
bindkey "^u" run-tmux-copy-up
# bindkey '^f' run-tmux-sessionizer
# ctrl + u - enter tmux copy mode and scroll up once
# bind -M vicmd "^u" 'tmux copy-mode'
# bindkey -M viins "^u" tmux copy-mode
