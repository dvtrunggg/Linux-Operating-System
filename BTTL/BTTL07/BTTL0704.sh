#! /bin/bash

if [ $# -lt 3 ] ; then
    echo "Usage: number1 operand number2 "
    echo "if you want to do multiplication: Usage: number1 x number2"
    echo "number1 * number2 will not working!"
    exit 1
else
    a="$1"
    b="$3"
    operand="$2"
fi

if [ $operand = "+" ] ; then
    echo "$(($a+$b))"
elif [ $operand = "-" ] ; then
    echo "$(($a-$b))"
elif [ $operand = "x" ] ; then
    echo "$(($a*$b))"
elif [ $operand = "/" ] ; then
    if [ $b -ne 0 ] ; then
	echo "$(($a/$b))"
    else
	echo "Infinity"
    fi
else
    echo "Khong co gi ca"
fi

     

