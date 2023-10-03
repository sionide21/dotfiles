app_path() {
    if [ -z "$1" ]; then
        APP_PATH="$PWD"
    else
        local arg=`basename $1`
        APP_PATH="$(realpath "$PROJECTS_DIR/$arg")"
        if [ ! -d "$APP_PATH" ]; then
            echo "Cannot find $1"
            return -1
        fi
    fi
}

iterm_title() {
    echo -ne "\033]0;"$1"\007"
}

# ctags generation for rails
retags() {
  ctags -R --languages=ruby --exclude=.git --exclude=log .
}

# cd, but better
gt() {
    app_path "$1" && cd "$APP_PATH"
}
complete -F _poi_completion gt

# Open app in atom
edit() {
    app_path "$1" && atom "$APP_PATH"
}
complete -F _poi_completion edit

# Start a server in a foreman project
run() {
    local PROJECT=$1
    shift
    app_path $PROJECT && (cd $APP_PATH && iterm_title "$(basename "$PWD")" && bundle exec foreman start $@)
}
complete -F _foreman_completion run

# tail the dev logs
logcat() {
    local environment="development"
    [ -z "$2" ] || environment=$2
    app_path $1 && less -r +F $APP_PATH/log/${environment}.log
}
complete -F _foreman_completion logcat
