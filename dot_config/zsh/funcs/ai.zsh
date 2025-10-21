function askc() {
  #if LLM_CID is not set, set it to the last conversation id
  if [ -z "$LLM_CID" ]; then
    export LLM_CID=$(__setCID)
  fi
  llm prompt --cid "$LLM_CID" "$@"
}

function resume() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: resume <conversation_id> <message>"
    return 1
  fi
  export LLM_CID="$1"
  askc "$2"
}

function ask() {
  # remove LLM_CID from env for this command
  unset LLM_CID;
  llm "$@"
}

function logc() {
  if [ -z "$LLM_CID" ]; then
    export LLM_CID=$(__setCID)
  fi
  llm logs --cid "$LLM_CID" "$@"
}

function sdc() {
  logc "$@" | sd
}

function __setCID() {
  llm logs list -c -n 1 --json | jq -r '.[].conversation_id'
}
