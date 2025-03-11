
# install xorg
pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot

# move to the gh-repos
mkdir -p ~/gh-repos/personal/personal-suckless-configs
mv ./* ~/gh-repos/personal/personal-suckless-configs

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
chmod +x ~/.config/suckless/sync.sh
bash ~/.config/suckless/sync.sh

# install yay
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd .. && rm -rf yay
fi

# install nerd fonts
yay -S nerd-fonts

# install ly tui greeter
yay -S ly

# install brightnessctl
yay -S brightnessctl

# install zsh
yay -S zsh

# install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# autosuggesions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search


echo "add this to your .zshcrc"
echo "
# Terminal autocomplete fix
autoload -Uz compinit && compinit

plugins=(
    git
    docker
    asdf
    nvm
    npm
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
)
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh
"

echo "
This isn't bad to add either

export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/init-nvm.sh
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

"