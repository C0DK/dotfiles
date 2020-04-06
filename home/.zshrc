# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.emacs.d/bin/:$PATH
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export CFLAGS="-Wno-error=deprecated -Wno-error=int-to-pointer-cast"
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

plugins=(virtualenv git)


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

DISABLE_AUTO_UPDATE="true"


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source ~/.virtualenv-autodetect.sh


alias sudoman="sudo pacman"
alias gimme="sudo pacman -S"
alias yao="yaourt"
alias py="python"
alias py2="python2"
alias django="python3 manage.py"
alias tasks='grep --exclude-dir=.git -rEI "TODO|FIXME|todo" . 2>/dev/null'
alias shrugs='echo "¯\_(ツ)_/¯"'
alias notes='note'
alias dailynote='note `date +%Y-%m-%d`'
alias notelist='ls ~/Documents/Notes' 
alias listnote='notelist'
alias listnotes='notelist'
alias noteslist='notelist'
alias clean='clear'
#alias kb='keybase'
alias clearofetch='clear && neofetch'
alias neofetch_long='clear && neofetch --config ~/.config/neofetch/config_long.conf'
alias jrnl=' jrnl'
alias readjrnl=' jrnl -from "1/1/2000" | less +G'
alias idk='echo "ok, buddy"'
alias cln='clean'
alias cf='clearofetch'

eval $(thefuck --alias fq)

note() {
	if [ "$#" -eq 1 ]; then
		vim note:$1
	elif [ "$#" -eq 0 ]; then
		vim note:
	else 
		echo 'wrong amount of arguments'
	
	fi

}
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
