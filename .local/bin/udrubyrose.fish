#!/usr/bin/env fish
argparse --exclusive 'r,u' r/rsync u/unison l/loop h/help -- $argv

if test -n "$_flag_help"
    echo "Update RubyRose server to sync with ~/Documents/rubyrose using rsync"
    echo "-u --unison Use unison backend. Syncs in both directions. Requires unison to be installed on remote"
    echo "-l --loop Sync repeatedly until stopped"
    exit
else if test -n "$_flag_unison"
    set sync unison -batch ~/Documents/rubyrose/ \
        ssh://root@$iprubyrose:3333//var/www/
else
    set sync rsync -rvz -e 'ssh -p 3333' --info=progress2 \
        ~/Documents/rubyrose/ root@$iprubyrose:/var/www/ \
        --exclude ~/Documents/rubyrose/rcxeblog/_site/ \
        --delete
end
while true
    $sync
    $sshrubyroseroot "cd /var/www/rcxeblog/
bundle exec jekyll build"
    if not test -n "$_flag_loop"
        break
    end
end
