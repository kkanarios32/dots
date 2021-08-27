[ -f ~/.config/zsh/plugins/fzf/.fzf.zsh ] && source ~/.config/zsh/plugins/fzf/.fzf.zsh
# Default
export FZF_DEFAULT_OPTS='
    --height 40%
    --layout=reverse
    --border
    --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
    --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'
export FZF_DEFAULT_COMMAND="fd --type f --follow --hidden --no-ignore-vcs"

# CTRL-R
export FZF_CTRL_R_OPTS='--sort --exact'
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle -N fzf-history-widget-accept
bindkey '^R' fzf-history-widget-accept

# ALT-C
export FZF_ALT_C_OPTS=$FZF_DEFAULT_OPTS
export FZF_ALT_C_COMMAND="fd --type d --follow --hidden --no-ignore-vcs"
bindkey "ç" fzf-cd-widget

# VIM
fzf-vim() {
    FILE=$(fzf</dev/tty)
    [ -n "$FILE" ] && "$EDITOR" "$FILE"
    zle reset-prompt
}

zle -N fzf-vim
bindkey '^F' fzf-vim

# CTRL-T
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# COMPGEN
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}
