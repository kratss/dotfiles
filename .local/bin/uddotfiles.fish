#!/usr/bin/env fish

# Copy my dotfiles to a folder with a git repo, then push to origin
set dotfolder ~/Projects/dotfiles4
cd $dotfolder
rm -rf ./.local ./.config
mkdir -p .local .local/bin .config
cp -rf ~/.local/bin/* ./.local/bin/
cp -rf \
    ~/.config/fish/ \
    ~/.config/foot/ \
    ~/.config/fuzzel/ \
    ~/.config/fzf/ \
    ~/.config/hawk/ \
    ~/.config/nvim/ \
    ~/.config/qutebrowser/ \
    ~/.config/sway/ \
    ~/.config/swayidle/ \
    ~/.config/swaylock/ \
    ~/.config/systemd/ \
    ~/.config/tridactyl/ \
    ~/.config/waybar/ \
    ./.config/
git add .*
git commit -m "Update dotfiles (Commit generated automatically)"
git push -u origin master
