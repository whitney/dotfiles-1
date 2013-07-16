

#Helper function to quckly get a host

xobni() {
  
  # When no command arguments are passed
  # Just print the full list of hosts
  if [ -z "$1" ]; then
    ls ~/work/ops/hiera/hieradata/host/ | sed 's/\.yaml//' | grep "xobni.com" 
  fi

  if [ -n "$1" ]; then
    ls ~/work/ops/hiera/hieradata/host/ | grep -e \\."$1" | sed 's/\.yaml//' | grep "$2" | grep "xobni.com"
    export t=$(ls ~/work/ops/hiera/hieradata/host/ | grep -e \\."$1" | sed 's/\.yaml//' | grep "$2" | grep "xobni.com")
  fi
}
