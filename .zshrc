
# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$GOPATH/bin:$PATH


# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

plugins=(virtualenv git)


POWERLEVEL9K_MODE='awesome-fontconfig'
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# settings for powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv pyenv_joined nodeenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)



BASIC_COLOR='default'
POWERLEVEL9K_VIRTUALENV_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_VIRTUALENV_FOREGROUND='cyan'

POWERLEVEL9K_VI_INSERT_MODE_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_VI_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_VI_INSERT_MODE_STRING=' '
POWERLEVEL9K_VI_COMMAND_MODE_STRING=' '

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='red'
POWERLEVEL9K_DIR_HOME_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_DIR_HOME_FOREGROUND='default'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='default'
POWERLEVEL9K_DIR_ETC_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_DIR_ETC_FOREGROUND='white'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'

POWERLEVEL9K_STATUS_OK_BACKGROUND=$BASIC_COLOR
POWERLEVEL9K_STATUS_OK='false'
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=''
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=''


POWERLEVEL9K_SHORTEN_DIR_LENGTH='3'
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"


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
#alias kb='keybase'
alias clearofetch='clear && neofetch'
alias neofetch_long='clear && neofetch --config ~/.config/neofetch/config_long.conf'
alias jrnl=' jrnl'
alias readjrnl=' jrnl -from "1/1/2000" | less +G'


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
BROWSER=/usr/bin/firefox
export VISUAL=vim
export EDITOR="$VISUAL"
export KEYTIMEOUT=1
setopt HIST_IGNORE_SPACE

