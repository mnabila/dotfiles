### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### User config here
zinit wait="2" lucid light-mode for \
    jocelynmallon/zshmarks

zinit light-mode for \
    zsh-users/zsh-autosuggestions \
    zdharma/fast-syntax-highlighting \
    zimfw/input \
    zimfw/utility

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

# fzf
zinit ice wait lucid id-as="fzf/completion"
zinit snippet /usr/share/fzf/completion.zsh
zinit ice wait lucid id-as="fzf/key-bindings"
zinit snippet /usr/share/fzf/key-bindings.zsh

# functions
zinit ice wait lucid id-as="functions/git-svn"
zinit snippet ~/.zsh/functions/git-svn.zsh

# completion enhancements
zinit ice wait lucid id-as="config/completion"
zinit snippet ~/.zsh/config/completion.zsh

# input enhancements
# zinit ice wait lucid id-as="config/input"
# zinit snippet ~/.zsh/config/input.zsh

### End of Zinit's installer chunk


# enable autocd
setopt autocd

# History
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v
KEYTIMEOUT=1

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history)

# prompt
export STARSHIP_CONFIG=~/.zsh/starship.toml
eval "$(starship init zsh)"

# aliases
[ -f ~/.aliases ] && source ~/.aliases
