#! /bin/bash

 

#cau 1: tao file 18126035_BTTH06.sh


#cau 2:
getLengthList () #ham tra ve so luong so nguyen.....
{
    STRING="$*"
    count=$(echo ${STRING} | wc -w)
    echo "Number of digit : $count "
}

#bai 3 
displayList ()  # ham hien thi dai dai day so
{
    STRING="$*"
    count="$(echo ${STRING} | wc -w)"
    echo "Number of digit : $count"
    echo "String : $*"
}
#cau 4
getEvenNumbers () # ham hien thi so chan
{
    STRING="$*"
    echo "Even numbers: "
    for i in $STRING
    do
	let test=$i%2
	if [ $test -eq 0 ]
	then echo "$i"
	     fi
    done
}
#cau 5
getOddNumbers ()           # ham hien thi so le
{
    STRING="$*"
    echo "Odd numbers: "
    for i in $STRING
    do
	let test=$i%2
	if [ $test -ne 0 ]
	then
	    echo "$i"
	fi
	done
}
#cau 6
getMax ()       # ham hien thi max
{
    STRING="$*"
    max="$1"
    for i in $STRING
    do
	if [ $max -lt $i ]
	then
	    let max=$i
	fi
    done
    echo "Max: $max"
}    
#cau 7
getMin()       # ham hien thi min
{
    STRING="$*"
    min="$1"
    for i in $STRING
    do
	if [ $min -gt $i ]
	then
	    let min=$i
	fi
    done
    echo "Min: $min"
}
#cau 8
getValueAt ()    #ham kiem tra vi tri hop le.....
{
    local pos="$1"
    STRING="$*"
    substring=${STRING#*$1}
    echo "Position: $pos"
    echo "String :$substring"
    count=1
    for i in $substring
    do
	if [ $pos -eq $count ]
	then echo "Value : $i"
	fi
	let count=$count+1
	   done
}

#cau 9: nhap file dau vao va lay cac dong cua file (day so) de thao tac
echo "Nhap file dau vao: "

#file="$1"  # cach dung tham so dau vao
read file # cach dung nhap tu ban phim (em dung cach nay nha thay:))
if ! [ -s $file ] ; then
    echo "Empty"
    exit 1
else
    n=1
    while read line; do
	# reading each line
	echo "Line No. $n : $line"
	getLengthList $line
	displayList $line
	getEvenNumbers $line
	getOddNumbers $line
	getMax $line
	getMin $line
	getValueAt $line
	echo "------------------------------------"

	
	n=$((n+1))
    done < $file
fi

