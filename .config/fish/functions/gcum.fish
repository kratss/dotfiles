function gcum --description "Unmount & clean mount point"
    history clear-session
    set -l path $argv[1]
    fusermount -u $path
    rmdir $path
end
