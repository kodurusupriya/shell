#!/bin/bash
### special variables ###
echo "ALL args passed to script: $@"
echo "Number of vars passed to script: $#"
echo "script name: $0"
echo "present directory: $pwd"
echo "who is running: $user"
echo "home directory of current user: $home"
echo "pid of this script: $$"
sleep 100 &
echo "background process id: $!"
echo "ALL args passed to script: $*"