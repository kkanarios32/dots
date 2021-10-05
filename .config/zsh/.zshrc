[[ $- != *i* ]] && return

# History in cache directory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

for file in $ZDOTDIR/src/*.zsh; do
    source "$file"
done

for file in $ZDOTDIR/plugins/configs/*.zsh; do
    source "$file"
done

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
