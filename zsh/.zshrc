# Instant prompt
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# [[file:README.org::*Instant prompt][Instant prompt:1]]
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Instant prompt:1 ends here

# Source .profile
# Source the =~/.profile= so we can get the path etc.
# Makes it possible to change relevant parameters in profile for various machines

# [[file:README.org::*Source .profile][Source .profile:1]]
source ~/.profile
# Source .profile:1 ends here

# various exports
# Various exports that are required for external programs etc.

# [[file:README.org::*various exports][various exports:1]]
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export CFLAGS="-Wno-error=deprecated -Wno-error=int-to-pointer-cast"
export TERM="xterm-256color"
# various exports:1 ends here

# Plugins

# [[file:README.org::*Plugins][Plugins:1]]
plugins=(virtualenv git autoswitch_virtualenv zsh-autosuggestions zsh-syntax-highlighting )
# Plugins:1 ends here

# Auto suggest
# [[https://github.com/zsh-users/zsh-autosuggestions/][zsh-autosuggestions]] is great to suggest completions based on history

# [[file:README.org::*Auto suggest][Auto suggest:1]]
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="PLEASE"
bindkey '^ ' autosuggest-accept
# Auto suggest:1 ends here

# Make pasting with autosuggest faster
# see: https://github.com/zsh-users/zsh-autosuggestions/issues/238

# [[file:README.org::*Make pasting with autosuggest faster][Make pasting with autosuggest faster:1]]
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
# Make pasting with autosuggest faster:1 ends here

# auto update
# Disables auto update.. for some reason

# [[file:README.org::*auto update][auto update:1]]
DISABLE_AUTO_UPDATE="true"
# auto update:1 ends here

# Caching

# [[file:README.org::*Caching][Caching:1]]
SAVEHIST=10000
HISTSIZE=12000
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE
HISTFILE=$ZSH_CACHE/history
# Caching:1 ends here

# Enable Oh My Zsh

# [[file:README.org::*Enable Oh My Zsh][Enable Oh My Zsh:1]]
source $ZSH/oh-my-zsh.sh
# Enable Oh My Zsh:1 ends here

# Set Theme (to P10K)

# [[file:README.org::*Set Theme (to P10K)][Set Theme (to P10K):1]]
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
# Set Theme (to P10K):1 ends here

# System things

# [[file:README.org::*System things][System things:1]]
alias sudoman="sudo pacman"
alias gimme="sudo pacman -S"
alias update='yay -Syu'
# System things:1 ends here

# =ls= extensions

# [[file:README.org::*=ls= extensions][=ls= extensions:1]]
alias lssize='sudo du -h . | sort -rh | head -10'
alias la="ls -la"
alias ls='ls --color=auto'
# =ls= extensions:1 ends here

# Python / Work

# [[file:README.org::*Python / Work][Python / Work:1]]
alias py="ipython"
alias kz="killall zoom"
alias django="python3 manage.py"
alias tasks='grep --exclude-dir=.git -rEI "TODO|FIXME|todo" . 2>/dev/null'
alias pytest-watch="while sleep 1 ; do find . -name '*.py' | entr -d -c pytest . ; done"
alias expecthon-watch="while sleep 1 ; do find . -name '*.py' | entr -d -c pytest --cov=expecthon -p no:sugar . ; done"
django-test-watch() {
 while sleep 1 ; do
    find . -name '*.py' | entr -d -c python manage.py test $@;
 done
}
# Python / Work:1 ends here

# Visuals
# Stuff for cleaning the screen etc

# [[file:README.org::*Visuals][Visuals:1]]
alias clean='clear'
alias cln='clean'
alias clearofetch='clear && neofetch'
alias cf='clearofetch'
alias neoclear='clear && neofetch'
alias neofetch_long='clear && neofetch --config ~/.config/neofetch/config_long.conf'
alias weather="wttr"
alias cleanwttr="clean && wttr"
alias cleanweather="cleanwttr"
# python haxs
# Visuals:1 ends here

# Shorthands

# [[file:README.org::*Shorthands][Shorthands:1]]
alias shrugs='echo "¯\_(ツ)_/¯"'
alias fibonacci='echo "1, 2, 3, 5, 8, 13, 21, 34, 55, 89"'
alias fib='fibonacci'
alias wolframalpha='wa'
# Shorthands:1 ends here

# Refresh config

# [[file:README.org::*Refresh config][Refresh config:1]]
alias zshsource='source ~/.zshrc'
# Refresh config:1 ends here

# Set XDG stuff

# [[file:README.org::*Set XDG stuff][Set XDG stuff:1]]
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
# Set XDG stuff:1 ends here

# Auto CD
# Not sure what is

# [[file:README.org::*Auto CD][Auto CD:1]]
setopt AUTO_CD
# Auto CD:1 ends here

# fuck
# [[https://github.com/nvbn/thefuck][The Fuck]] is a magnificent app, that corrects errors in previous console
# commands. This line enables it. (requires it to be installed)

# [[file:README.org::*fuck][fuck:1]]
eval $(thefuck --alias)
# fuck:1 ends here

# Visual

# [[file:README.org::*Visual][Visual:1]]
export VISUAL=vim
# Visual:1 ends here

# Editor
# Set to same as Visual

# [[file:README.org::*Editor][Editor:1]]
export EDITOR="$VISUAL"
# Editor:1 ends here

# VI mode

# [[file:README.org::*VI mode][VI mode:1]]
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char
bindkey '^[[3~' delete-char
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey '^X^X' hist-complete
# VI mode:1 ends here

# Ignore spaces in history

# [[file:README.org::*Ignore spaces in history][Ignore spaces in history:1]]
setopt HIST_IGNORE_SPACE
# Ignore spaces in history:1 ends here

# Enable P10k prompt
# To customize prompt edit the other heading edit.

# [[file:README.org::*Enable P10k prompt][Enable P10k prompt:1]]
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Enable P10k prompt:1 ends here
