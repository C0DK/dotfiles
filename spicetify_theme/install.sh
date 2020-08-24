#!/bin/sh
cp dribbblish.js "$(dirname "$(spicetify -c)")/Extensions/"
spicetify config extensions dribbblish.js
spicetify config current_theme custom color_scheme base
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply
