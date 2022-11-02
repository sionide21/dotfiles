_dirs() {
    local dir
    dir=`basename $1`
    find -L $1 -type d -maxdepth 1 | perl -pe 's/.*\/([^\/]+)$/$1/' | grep -v $dir
}

_list_projects() {
    _dirs $PROJECTS_DIR
}

_list_foreman_projects() {
    for project in `_list_projects`; do
        [ -f "$PROJECTS_DIR/$project/Procfile" ] && echo $project
    done
}

_complete_for() {
    APPS=`$1`
    prefix="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$APPS" -- $prefix) )
}

_poi_completion() {
    _complete_for _list_projects
    return 0
}

_foreman_completion() {
    _complete_for _list_foreman_projects
    return 0
}
