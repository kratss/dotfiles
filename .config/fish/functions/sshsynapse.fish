function sshsyanpse --wraps='$sshsynapse' --description 'alias sshsnyapse $sshsynapse'
    argparse r/root -- $argv
    if test -n "$_flag_root"
        $sshsynapse $argv
    else
        $sshsynapse $argv
    end
end
