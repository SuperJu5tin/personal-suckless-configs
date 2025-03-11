sudo make -C ~/.config/suckless/slstatus install
sudo make -C ~/.config/suckless/st install
sudo make -C ~/.config/suckless/dmenu install
sudo make -C ~/.config/suckless/dwm install

cp ~/.config/suckless/slstatus/config.h ~/gh-repos/personal/personal-suckless-configs/slstatus
cp ~/.config/suckless/st/config.h ~/gh-repos/personal/personal-suckless-configs/st
cp ~/.config/suckless/dmenu/config.h ~/gh-repos/personal/personal-suckless-configs/dmenu
cp ~/.config/suckless/dwm/config.h ~/gh-repos/personal/personal-suckless-configs/dwm-patch

git -C ~/gh-repos/personal/personal-suckless-configs commit -am "updates to configs"
git -C ~/gh-repos/personal/personal-suckless-configs push
