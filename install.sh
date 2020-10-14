# Get Fedora Version

ver=$(cat /etc/os-release | grep VERSION_ID= | awk -F\= '{print $2}')

# Installing Repositories

dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$ver".noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$ver".noarch.rpm

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg

cat << EOF > /etc/yum.repos.d/vscodium.repo
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
EOF

# Installing Packages by category

dnf upgrade -y
dnf install -y @base-x 
dnf install -y gnome-shell gnome-terminal nautilus gnome-tweaks xdg-user-dirs
lspci | grep NVIDIA && dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
dnf install -y firewall-config htop bpytop nmap wavemon exa vim
dnf install -y filezilla vlc obs-studio flameshot codium firefox chromium google-chrome-stable steam gimp
dnf install -y breeze-cursor-theme papirus-icon-theme adobe-source-code-pro-fonts gnome-themes-extra

# Hide Desktop Icons

mv /usr/share/applications/htop.desktop /usr/share/applications/htop.desktop.hide

# Enable Graphical User Interface

systemctl set-default graphical.target
