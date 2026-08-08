#!/bin/bash

# Loop through all modified files in the git repository
git diff --name-only | while read -r file; do
    # Check if the file actually has content changes (ignoring blank lines)
    if git diff --quiet --ignore-blank-lines --ignore-all-space "$file"; then
        echo "Restoring $file (only blank line changes detected)"
        git checkout -- "$file"
    fi
done
