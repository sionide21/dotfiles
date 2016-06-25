export PATH="$_dotfiles_dir/bin":$PATH

# Fancy Prompt
source $_dotfiles_dir/bash/prompt.bash

# Custom commands
source $_dotfiles_dir/bash/completions.bash
source $_dotfiles_dir/bash/functions.bash

# Defaults
export CLICOLOR="1"
export GREP_OPTIONS="--color"
export HISTCONTROL="ignoreboth"
export EDITOR="vim"

# Aliases
alias pp="pbpaste | pipewrench"
alias pw="pipewrench"
alias ve="vacuform exec"
