#!/usr/bin/env fish

set arg 

if contains 'file --mime-type $argv' 'text'
    echo asf
end
