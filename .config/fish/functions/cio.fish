# Check in and out a file in RCS at once
function cio
    ci -u $argv
    co -l $argv
end
