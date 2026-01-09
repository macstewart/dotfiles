# Bind Alt-\ to LLM command completion

__llm_cmdcomp() {
  local old_cmd=$BUFFER
  local cursor_pos=$CURSOR
  # echo $cursor_pos
  # if [ -z "$old_cmd" ]; then
    # old_cmd=""
    # cursor_pos=1
  # fi
  echo # Start the program on a blank line
  local result=$(llm cmdcomp "$old_cmd")
  if [ $? -eq 0 ] && [ ! -z "$result" ]; then
    BUFFER=$result
  else
    BUFFER=$old_cmd
  fi
  zle reset-prompt
}

zle -N __llm_cmdcomp
