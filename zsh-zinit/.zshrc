# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8

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
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait="2" lucid light-mode for \
    zdharma/zui \
    jocelynmallon/zshmarks \
    zdharma/zzcomplete

zinit light-mode for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zdharma/fast-syntax-highlighting \
    zimfw/input \
    zsh-users/zsh-history-substring-search \
    zimfw/utility

zinit ice wait lucid
zinit light zimfw/completion

# zinit plugins configurations
[ -f ~/.zinitrc ] && source ~/.zinitrc

### End of Zinit's installer chunk

# fzf
zinit ice wait lucid id-as="fzf/completion"
zinit snippet /usr/share/fzf/completion.zsh
zinit ice wait lucid id-as="fzf/key-bindings"
zinit snippet /usr/share/fzf/key-bindings.zsh

# functions
zinit ice wait lucid id-as="functions/git-svn"
zinit snippet ~/.zsh/functions/git-svn.zsh

# aliases
[ -f ~/.aliases ] && source ~/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit
compinit
