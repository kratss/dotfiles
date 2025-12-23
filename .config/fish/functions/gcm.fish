function gcm
    history clear-session
    if contains -- --help -h $argv
        echo "Mount gocryptfs folders by passing the mount point"
        exit
    end
    set -l fullpath $argv[1]
    set -l dir (dirname $fullpath)
    set -l base (basename $fullpath)
    mkdir -p $dir/$base
    gocryptfs $dir/.$base $dir/$base
end
