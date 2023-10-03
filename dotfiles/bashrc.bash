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

# Enable globstar (`**` expands subdirectories)
shopt -s globstar

# Compile docs when installing erlang
export KERL_BUILD_DOCS=yes

# Use binstubs if available
# Install binstubs using the following command
#
#     bundle install --binstubs=.git/safe/bin
#
# Since we're adding a relative path to our search path, tell bash to check
# if the file still exists instead of trusting its internal cache
shopt -s checkhash
export PATH=".git/safe/bin:$PATH"
