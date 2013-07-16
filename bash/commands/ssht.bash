
# Quick shortcut function to ssh to $t

ssht(){
  username=$(whoami)
  echo "Connecting to $username@$t"
  echo "----------------------------"
  ssh $t
}
