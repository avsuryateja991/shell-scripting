#!/bin/bash

NUM=$1

# -gt -lt, -eq -ge, -le
if [ $NUM -gt 100 ] 
then
    echo "$NUM is greater than 100"
else
    echo "$NUM is less than 100"
fi