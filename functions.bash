app_path() {
    [ -z "$1" ] && return -1
    local arg
    arg=`basename $1`
    APP_PATH="$PROJECTS_DIR/$arg"
    if [ ! -d "$APP_PATH" ]; then
        echo "Cannot find $1"
        return -1
    fi
}

# cd, but better
gt() {
    app_path $1 && cd $APP_PATH
}
complete -F _poi_completion gt

# Open app in atom
edit() {
    app_path $1 && atom $APP_PATH
}
complete -F _poi_completion edit

# Start a server in a foreman project
run() {
    app_path $1 && shift && (cd $APP_PATH && foreman start $@)
}
complete -F _foreman_completion run

# tail the dev logs
logcat() {
    local environment="development"
    [ -z "$2" ] || environment=$2
    app_path $1 && tail -f $APP_PATH/log/${environment}.log
}
complete -F _foreman_completion logcat
