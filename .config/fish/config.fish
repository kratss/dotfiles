if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting "Welcome to fish. 
  cddl: cd ~/Downloads/ 
  hk:   hawk.fish 
  sdu:  sudo dnf update
  v:    nvim
  wc:   wl-copy
  "
    abbr --add v --position command nvim
    abbr -a --position command cddl cd ~/Downloads/
    abbr -a --position command hk hawk.fish
    abbr -a wc --position command wl-copy
    abbr -a sdu --position command sudo dnf update
    alias ls "ls --group-directories-first --color --width=80"
end

source ~/.private/env.fish
set -x DEFAULT_TERM foot
set -x EDITOR nvim
set -gx RCS_DIR ~/.local/share/rcs/
set -gx XDG_CONFIG_HOME $HOME/.config

function fish_title
    echo (prompt_pwd)
end
