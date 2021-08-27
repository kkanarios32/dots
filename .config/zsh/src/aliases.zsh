# vim -> nvim
if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
    alias vim='nvim'
fi

# Dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# School
alias caen='ssh caen'

# Tools
alias tmux="TERM=screen-256color tmux"

# Tech Buddies
alias android="flutter emulators --launch Pixel_3a_API_30_x86"
alias ios="flutter emulators --launch apple_ios_simulator"
