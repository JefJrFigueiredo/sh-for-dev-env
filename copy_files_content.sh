#!/usr/bin/env sh

output=""

for item in "$@"; do
  if [ -d "$item" ]; then
    # If the argument is a directory, find all files within it recursively
    while read -r file; do
      output+="\n#\n# File: $file\n#\n\n"
      output+="$(cat "$file")\n"
    done < <(find "$item" -type f)
  elif [ -f "$item" ]; then
    # If the argument is a file, just process it directly
    output+="\n#\n# File: $item\n#\n\n"
    output+="$(cat "$item")\n"
  else
    output+="$item is not a valid file or directory.\n"
  fi
done

echo -e "$output" | xclip -sel clip
echo "Copied to clipboard!"
