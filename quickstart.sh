

# get current directory
CURRENT_DIR=$(pwd)

# move to the gh-repos
mkdir -p ~/gh-repos/personal/personal-suckless-configs
mv -r . ~/gh-repos/personal/personal-suckless-configs

# install dwm, dmenu, st, slstatus
mkdir -p ~/.config/suckless
cd ~/.config/suckless
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
git clone https://git.suckless.org/slstatus

# copy configs
cp ~/gh-repos/personal/personal-suckless-configs/dwm ~/.config/suckless/dwm/config.h
cp ~/gh-repos/personal/personal-suckless-configs/dmenu ~/.config/suckless/dmenu/config.h
cp ~/gh-repos/personal/personal-suckless-configs/st ~/.config/suckless/st/config.h
cp ~/gh-repos/personal/personal-suckless-configs/slstatus ~/.config/suckless/slstatus/config.h

cp ~/gh-repos/personal/personal-suckless-configs/sync.sh ~/.config/suckless/sync.sh

# make dwm, dmenu, st, slstatus
bash sync.sh

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -r yay

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"