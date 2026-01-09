
function handle_input() {
    local process_func="$1"
    shift

    if [ -p /dev/stdin ]; then
        # Read from pipe
        while IFS= read -r line; do
            "$process_func" "$line"
        done
    elif [ $# -gt 0 ]; then
        # Process arguments
        for arg in "$@"; do
            "$process_func" "$arg"
        done
    else
        echo "No input provided. Usage: command | $0 or $0 arg1 arg2 ..."
        return 1
    fi
}

# function mycsv() {
#     LC_ALL=C tr '\t' ','
# }
#
# function clens() {
#     mycsv | csvlens
# }
#
function mycsv() {
    awk '
    BEGIN { FS="\t"; OFS="," }
    {
        for(i=1; i<=NF; i++) {
            gsub(/,/, "\\,", $i)  # Escape existing commas
            if ($i ~ /[\t,]/) {
                gsub(/"/, "\"\"", $i)  # Double-escape quotes
                $i = "\"" $i "\""  # Quote fields with special characters
            }
        }
        print
    }
    '
}

function mysql_tsv_to_csv() {
  # Read input from stdin or file if provided
  input="${1:-/dev/stdin}"

  # Use awk to process the input
  echo $input | awk 'BEGIN { FS="\t"; OFS="," } {
    rebuilt=0
    for(i=1; i<=NF; ++i) {
      if ($i ~ /,/ && $i !~ /^".*"$/) { 
        gsub("\"", "\"\"", $i)
        $i = "\"" $i "\""
        rebuilt=1 
      }
    }
    if (!rebuilt) { $1=$1 }
    print
  }' 
}


# function mycsv() {
#     LC_ALL=C tr '\t' ',' | iconv -f ISO-8859-1 -t UTF-8//IGNORE
# }

function clens() {
    mycsv | csvlens
}
