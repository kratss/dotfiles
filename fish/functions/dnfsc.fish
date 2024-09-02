function dnfsc --wraps='dnf search -C' --description 'alias dnfsc=dnf search -C'
  dnf search -C $argv
        
end
