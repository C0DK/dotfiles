# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Makes it possible to change relevant parameters in profile for various machines
source ~/.profile

# If you come from bash you might have to change your $PATH.
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export CFLAGS="-Wno-error=deprecated -Wno-error=int-to-pointer-cast"
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
# This is different on server

plugins=(virtualenv git autoswitch_virtualenv zsh-autosuggestions zsh-syntax-highlighting )
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="PLEASE"

DISABLE_AUTO_UPDATE="true"


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# TODO find out if this is needed
#source ~/.virtualenv-autodetect.sh


alias sudoman="sudo pacman"
alias gimme="sudo pacman -S"
alias py="ipython"
alias django="python3 manage.py"
alias tasks='grep --exclude-dir=.git -rEI "TODO|FIXME|todo" . 2>/dev/null'
alias shrugs='echo "¯\_(ツ)_/¯"'

alias clean='clear'
alias cln='clean'
alias clearofetch='clear && neofetch'
alias cf='clearofetch'
alias neoclear='clear && neofetch'
alias neofetch_long='clear && neofetch --config ~/.config/neofetch/config_long.conf'
alias idk='echo "ok, buddy"'
alias wolframalpha='wa'
alias lssize='sudo du -h . | sort -rh | head -10'
alias weather="wttr"
alias cleanwttr="clean && wttr"
alias cleanweather="cleanwttr"

alias fibonacci='echo "1, 2, 3, 5, 8, 13, 21, 34, 55, 89"'
alias fib='fibonacci'
alias zshsource='source ~/.zshrc'

alias la="ls -la"
alias ls='ls --color=auto'

# ZSH stuff
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE
HISTFILE=$ZSH_CACHE/history
SAVEHIST=10000
HISTSIZE=12000
setopt AUTO_CD

eval $(thefuck --alias)

kb() {
	 keybase "${@:1}" | less
	
}


# Default browser
#BROWSER=/usr/bin/qutebrowser
export VISUAL=vim
export EDITOR="$VISUAL"
export KEYTIMEOUT=1
setopt HIST_IGNORE_SPACE

# use VI
bindkey -v
bindkey "^?" backward-delete-char
bindkey '^[[3~' delete-char
# helpers
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey '^X^X' hist-complete

bindkey '^ ' autosuggest-accept
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
