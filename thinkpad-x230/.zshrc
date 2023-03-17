fpath+=$HOME/.zsh/typewritten

autoload -U compinit promptinit
compinit
promptinit; prompt typewritten
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_RELATIVE_PATH="home"
export TYPEWRITTEN_PROMPT_LAYOUT="singleline_verbose"
export HISTFILE=~/.zsh-history
export HISTSIZE=1000
export SAVEHIST=1000
zstyle ':completion::complete:*' use-cache 1

alias docx-conv="pandoc -s -o"
alias gentoo-update="doas emerge --ask --quiet --deep --newuse --update --keep-going @world"
