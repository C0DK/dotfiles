#/bin/sh
# TODO create a helper function that creates the folder if non existing
stow keymaps -t ~/dev/qmk_firmware/keyboards/preonic/keymaps/
#stow home -t ~/
stow firefox -t ~/.mozilla/firefox/j6vz64pz.default-release-1/chrome/
stow i3 -t ~/.config/i3
stow doom -t ~/.config/doom
stow zsh -t ~/
stow gitconfig -t ~/
stow vim -t ~/
stow xresources -t ~/
stow neofetch -t ~/.config/neofetch
stow spicetify_theme -t ~/.config/spicetify/Themes/custom
stow picom -t ~/.config/picom
stow polybar -t ~/.config/polybar
stow dunst -t ~/.config/dunst
stow alacritty -t ~/.config/alacritty
stow scripts -t ~/bin
