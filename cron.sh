#!/usr/bin/env bash
# This script is intended to be run as a cron job at 23:55 daily
###  DESCRIPTION    ###########################################################
# + count how many words have been cumulatively written
# + prettify all files in the directory
# + list outstanding TODOS in the markdown files
# + commit the changes to the git repository

###  VARIABLES      ###########################################################
_OUTFILE="README.md"
_TODAY=$(date +%Y-%m-%d)
_TODOS="TODOS.md"

###  FUNCTIONS      ###########################################################

_get_wc() {
    cat [0-9]*/*.md | wc -w
}

_todo_headers() {
    printf "\n| File | TODO |\n|------|------|\n"
}

_todo_count() {
    # prints the number of TODOs in the markdown files
    grep -o "TODO:" **/*.md | wc -l
}

_list_todos() {
    # prints all the TODOs in the markdown files
    # strips <!-- TODO: and --> from the output
    # Returns: | <file> | <todo> |
    _todo_headers
    find . -name "*.md" | while read -r file; do
        grep -o "<!-- TODO:.*-->" "$file" | sed -e 's/<!-- TODO: //g' -e 's/ -->//g' |
            while read -r line; do
                echo "| [""$file""](""$file"") |" "$line" "|"
            done
    done | sort
}

_git_commit() {
    git add .
    git commit -m "Auto commit: $_TODAY"
    git push
}

###  MAIN           ###########################################################
_WC=$(_get_wc)
_TODO=$(_todo_count)

echo "|" "$_TODAY" "|" "$_WC" "|" "$_TODO" "|" >>$_OUTFILE
_list_todos >$_TODOS
find . -name "*.md" -exec npx prettier --write {} +
sleep 2
_git_commit
