#!/usr/bin/env bash

# Check if there are at least 2 arguments (search terms and path)
if [ $# -lt 2 ]; then
  echo "Usage: $0 <word1> <word2> ... <wordN> <path>"
  exit 1
fi

# Save the path as the last argument
path="${!#}"

# Remove the last argument (path) from the arguments array
set -- "${@:1:$#-1}"

# Initialize the search command with the first word and exclude patterns
search_command="find '$path' -type f -iname '*.*' ! -iname '*.csv' ! -iname '*.log' ! -iname '*.json' -print0 | xargs -0 grep -il '$1'"

# Add additional words to the search command and exclude patterns
for word in "${@:2}"; do
  search_command+=" | xargs -0 grep -il '$word'"
done

# Execute the search command
eval "$search_command"
