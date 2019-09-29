

msg=$(curl --silent --fail https://whatthecommit.com/index.txt)
git -C ~/.dotfiles aacmp "$msg"
git -C ~/Documents aacmp "$msg"
