# Get User

currentuser=$(id -un)

# Customize Session

## Background

wget https://github.com/maximesence/fedora-minimal-install/raw/main/material-white.png -P /home/$currentuser/.local/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri 'file:///home/'$currentuser'/.local/share/backgrounds/material-white.png'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/'$currentuser'/.local/share/backgrounds/material-white.png'

## Theme, Cursor and Icon

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

## Font

gsettings set org.gnome.desktop.interface font-name 'Source Code Pro 11'
gsettings set org.gnome.desktop.interface document-font-name 'Source Code Pro 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Source Code Pro Bold 11'

## Other
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

# Set alias and bash history configuration

cat << EOF >> /home/$currentuser/.bashrc
alias ls="exa --group-directories-first --time-style long-iso"

# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
EOF

# Extensions

cat << EOF > /home/$currentuser/extensions.list
https://extensions.gnome.org/extension/1160/dash-to-panel/
https://extensions.gnome.org/extension/545/hide-top-bar/
https://extensions.gnome.org/extension/906/sound-output-device-chooser/
https://extensions.gnome.org/extension/1231/switch-workspace/
https://extensions.gnome.org/extension/1414/unblank/
https://extensions.gnome.org/extension/302/windowoverlay-icons/
https://extensions.gnome.org/extension/28/gtile/
EOF
