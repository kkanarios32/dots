# Custom prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats "%F{#4C566A}╾─╼[%f%F{#EBCB8B}√%r%f%F{#4C566A}]%f%F{#4C566A}[%f%F{#EBCB8B}ᚴ%b%f%F{#4C566A}]%f"
precmd() { vcs_info }

setopt PROMPT_SUBST
PS1='%F{#4C566A}[%f%F{#88C0D0}⌖ ${PWD/*\//}%f%F{#4C566A}]%f${vcs_info_msg_0_}%F{#4C566A}╾─╼[%f%F{#BF616A}⥁ %D{%L:%M}%f%F{#4C566A}]%f %F{#4C566A}→%f '
TMOUT=60
TRAPALRM() { zle reset-prompt }
# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
