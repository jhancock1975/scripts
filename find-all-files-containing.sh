#!/usr/bin/env bash

# Usage: find-files-containing [search_directory] [search_pattern] [grep_pattern]

search_directory="$1"
search_pattern="$2"
grep_pattern="$3"

# Check if arguments are provided
if [ -z "$search_directory" ] || [ -z "$search_pattern" ] || [ -z "$grep_pattern" ]; then
    echo "Usage: $0 [search_directory] [search_pattern] [grep_pattern]"
    exit 1
fi

# Use find to get the list of files and iterate through them
find "$search_directory" -type f -name "$search_pattern" | while read -r file; do
    # Use grep to search for the pattern in the file
    grep -Hn --color=auto "$grep_pattern" "$file"
done
