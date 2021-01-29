#!/bin/bash

#cau 1: tao file BTTL9_18126035.sh

#cau 9: thiet lap cac flag
flag_sum=false
flag_mult=false
flag_odd=false
flag_even=false
flag_display=false
flag_sort=false

declare -a array
#cau 2: huong dan su dung lenh
showHelp ()
{
	echo "$0 [-h|--help] [-s|--sum] [-m|-- mult] [-o|--odd] [-e|--even] [-d|--display] [--sort] day_so_cach_nhau_khoang_trang"
}

#cau 3: ham hien thi mang so
displayNumbers ()
{
    local -n tab="$1"
    echo "${tab[*]}"
}

#cau 4: ham hien thi cac phan tu le
getOdd ()
{
    local -n tab="$1"
    echo "Odd numbers:"
    for i in ${tab[@]}
    do
	     if ! (( i % 2 == 0 ))
	     then
		 echo $i
	     fi
    done
}

#cau 5: ham hien thi cac phan tu chan
getEven ()
{
    local -n tab="$1"
    echo "Even numbers:"
    for i in ${tab[@]}
    do
	     if (( i % 2 == 0 ))
	     then
		 echo $i
	     fi
    done
}

#Cau 6: ham tinh tong cac phan tu
getSum ()
{
    local -n tab="$1"
    echo "Sum:"
    for i in ${tab[@]}
    do
	s=$((s + i))
    done
    echo $s
}

#Cau 7: ham hien thi tich cac phan tu
getMult ()
{
    m=1
    local -n tab="$1"
    echo "Multiply:"
    for i in "${tab[@]}"
    do
	m=$((m * i))
    done
    echo $m
}


#Cau 8: ham sort theo tang dan
sortArray () 
{
    local -n tab="$1"
	for ((i=0; i <= $((${#tab[@]} - 2)); i++))
	do
        	for ((j=((i + 1)); j <= ((${#tab[@]} - 1)); j++))
        	do
        		if [[ ${tab[i]} -gt ${tab[j]} ]]
            		then
               			temp=${tab[i]}
                		tab[i]=${tab[j]}
                		tab[j]=$temp         
            		fi
        	done
    	done
    echo "Sorted array is:"
    displayNumbers array
}

#cau 9: 
showArray ()
{
    
    if $flag_sum
    then
      
	getSum array
    fi

    if $flag_mult
    then getMult array
    fi

    if $flag_odd
    then getOdd array
    fi

    if $flag_even
    then getEven array
    fi

    if $flag_display
    then
	displayNumbers array
    fi

    if $flag_sort
    then sortArray array
    fi
}

while [ $# -gt 1 ]
do
     case "$1" in
	 "-h|--help")
	     showHelp
	     break;;
	 "-s"|"--sum")
	     flag_sum=true
	     shift;;
	 "-m"|"--mult")
	     flag_mult=true
	     shift;;
	 "-o"|"--odd")
	     flag_odd=true
	     shift;;
	 "-e"|"--even")
	     flag_even=true
	     shift;;
	 "-d"|"--display")
	     flag_display=true
	     shift;;
	 "--sort")
	     flag_sort=true
	     shift;;
	 *) showHelp
	     break;;
	 esac
done

array=("$@")

showArray





