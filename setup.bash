[ -z "$PROJECTS_DIR" ] && PROJECTS_DIR="$HOME/src"

_dotfiles_dir="$(dirname $BASH_SOURCE)"

source $_dotfiles_dir/dotfiles/bashrc.bash

# Use custom RCs
_dotfile() {
    local rcfile="$HOME/.${1%.*}"
    [ -e "$rcfile" ] || ln -s "$_dotfiles_dir/dotfiles/$1" "$rcfile"
}

_dotfile vimrc.vim
