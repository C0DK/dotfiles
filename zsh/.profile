# .profile
# :PROPERTIES:
# :header-args: :tangle .profile :comments both :padline yes
# :END:
# todo cleanup here.

# [[file:README.org::*.profile][.profile:1]]
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/firefox
export GOPATH=$HOME/.cache/go
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.config/emacs/bin/:$PATH
export ZSH=/usr/share/oh-my-zsh
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
# .profile:1 ends here
