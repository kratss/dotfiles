function sshrubyrose --wraps='$sshrubyrose' --description 'alias sshrubyrose $sshrubyrose'
    argparse r/root -- $argv
    if test -n "$_flag_root"
        $sshrubyroseroot $argv
    else
        $sshrubyrose $argv
    end
end
