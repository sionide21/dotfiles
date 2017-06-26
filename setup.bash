[ -z "$PROJECTS_DIR" ] && PROJECTS_DIR="$HOME/src"

_dotfiles_dir="$(dirname $BASH_SOURCE)"

source $_dotfiles_dir/dotfiles/bashrc.bash

# Use custom RCs
_dotfile() {
    local rcfile="$HOME/.${1%.*}"
    [ -e "$rcfile" ] || ln -s "$_dotfiles_dir/dotfiles/$1" "$rcfile"
}

_dotdir() {
    local rcfile rcdir dotdir
    dotdir="$_dotfiles_dir/dotfiles/$1"
    rcdir="$HOME/.$1"
    [ -d "$rcdir" ] || mkdir "$rcdir"
    for file in $(find "$dotdir" -type f); do
        rcfile="$rcdir/${file#$dotdir}"
        [ -e "$rcfile" ] || ln -s "$file" "$rcfile"
    done
}

_dotfile vimrc.vim
_dotfile ctags.conf
_dotdir emacs.d
