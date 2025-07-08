#!/bin/bash
echo "All variables: $@"
echo "Number of variables: $#"
echo "scrpt name: $0"
echo "prest work directory: $PWD"
echo "Home dir of current user: $USER"
echo "process id of current script: $$"
sleep 60  &
echo "process id of last command in background: $!"
echo "previous commands exit status: $?"

