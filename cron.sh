#!/usr/bin/env bash
# This script is intended to be run as a cron job at 23:55 daily
###  DESCRIPTION    ###########################################################
# + count how many words have been cumulatively written in _numbered_ markdown files
# + prettify all files in the directory
# + list outstanding TODOS in the markdown files
# + update the README.md file with the word count and TODO count
# + commit the changes to the git repository

###  VARIABLES      ###########################################################
_README="README.md"
_TODAY=$(date +%Y-%m-%d)
_TODOS="TODOS.md"
_TODO_FILTER="<!-- TODO:.*-->"
_OUTPUTS=("$_TODOS" "$_README")

###  FUNCTIONS      ###########################################################

_get_files() {
    # use the same file filter throughout...
    find . -regex '^\.\/[0-9][0-9]\/.*[0-9]\.md' | sort
}

_all_contents() {
    # prints the contents of all the markdown files
    # splitting of variables is intentional ;)
    # shellcheck disable=SC2046
    cat $(_get_files)
}

_get_wc() {
    # xargs to trim the whitespace...
    _all_contents | wc -w | xargs
}

_get_todo_count() {
    # prints the number of TODOs in the markdown files
    _all_contents | grep -c "$_TODO_FILTER"
}
_set_progress() {
    OUTFILE=$1
    _WC=$(_get_wc)
    _TODO=$(_get_todo_count)
    echo "|" "$_TODAY" "|" "$_WC" "| [""$_TODO""](TODOS.md) |" >>$OUTFILE
}

_todo_headers() {
    printf "\n| File | TODO |\n|------|------|\n"
}

_list_todos() {
    # prints all the TODOs in the markdown files
    # strips <!-- TODO: and --> from the output
    # Returns: | <file> | <todo> |
    _todo_headers
    _get_files | while read -r file; do
        grep -o "$_TODO_FILTER" "$file" | sed -e 's/<!-- TODO: //g' -e 's/ -->//g' |
            while read -r line; do
                echo "| [""$file""](""$file"") |" "$line" "|"
            done
    done | sort
}

_build_todos() {
    TODOS=$1
    # build the TODOS.md file
    _list_todos >"$TODOS"
}

_prettify() {
    # prettify all the markdown files in the directory
    files=$(_get_files)
    for file in $files; do
        npx prettier --write "$file"
    done
}

_prettify_outputs() {
    # prettify the README.md and TODOS.md files
    for file in "${_OUTPUTS[@]}"; do
        npx prettier --write "$file"
    done
}

_git_commit() {
    git add .
    git commit -m "Auto commit: $_TODAY"
    git push
}

_usage() {
    echo "Usage: $0 [-pug]"
    echo "Options:"
    echo "  -p  Print word count and TODO count"
    echo "  -u  Update README.md and TODOS.md"
    echo "  -g  Git commit and push"
}

###  MAIN           ###########################################################

_MAIN() {
    while getopts "pug" opt; do
        case $opt in
        p)
            printf "%sWord count:\t$(_get_wc)\n"
            printf "%sTODO count:\t$(_get_todo_count)\n"
            ;;
        u)
            _set_progress $_README
            _build_todos $_TODOS
            _prettify
            _prettify_outputs
            ;;
        g)
            _git_commit
            ;;
        \?)
            _usage
            ;;
        esac
    done
}

_MAIN "$@"
