#! /bin/bash

factor="$1"

if [ $# -le 1 ] ; then
    echo "Usage: $0 factor arg"
    exit 1
fi
echo "factor: $factor"
while [ $# -gt 1 ] ; do
    shift
    arg="$1"
    echo "$factor * $arg = $(($factor*$arg))"
done
