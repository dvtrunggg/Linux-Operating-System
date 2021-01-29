#Dinh Viet Trung, MSSV: 18126035

#! /bin/bash

#cau 1: tao file

#cau 2: ham hien thi huong dan su dung lenh
showHelp() {
    echo "Usage: $0  [-h|--help] [--min] [--max] [-d|--display] [-s|--sort] day_so_cach_nhau_khoang_trang"
}

#cau 3: ham nhan dau vao la day so, cach nhau khoang trang. Hien thi ra chuoi so ra man hinh
displayNumbers() {
    for i in $*
    do
	echo "$i"
	done
}

#cau 4: ham tim min cua day so
getMin() {
    local min="$1"
    for i in $*
    do
	if [ $i -lt $min ] ; then min=$i; fi
    done
    echo "Min: $min"
}

#cau 5: ham tim max cua day so
getMax() {
   local  max="$1"
    for i in $*
    do
	if [ $i -gt $max ] ; then max=$i; fi
    done
    echo "Max: $max"
}

#cau 6: sort day so
sortList() {
    for i in $* ; do
	echo "$i"
    done | sort -n  # sort -n -u neu khong muon trong day so co so giong nhau
}

#cau 7: xu ly tham so dau vao, hien thi thong tin tuy chon.....

FLAG_HELP=false
FLAG_MIN=false
FLAG_MAX=false
FLAG_DISPLAY=false
FLAG_SORT=false

#  hien thi thong tin va cac tuy chon

while [ $# -gt 0 ] ; do
    case "$1" in
	-h|--help) FLAG_HELP=true
		   shift;;
	--min) FLAG_MIN=true
	       shift;;
	--max) FLAG_MAX=true
	       shift;;
	-d|--display) FLAG_DISPLAY=true
		      shift;;
	-s|--sort) FLAG_SORT=true
		   shift;;
		      
	*)  echo "$*"
	    break;;
    esac
done

if $FLAG_HELP  ; then
    showHelp $*;
fi

if $FLAG_MIN ; then
    getMin $*
fi

if $FLAG_MAX ; then
    getMax $*
fi

if $FLAG_DISPLAY ; then
    displayNumbers $*
fi

if $FLAG_SORT ; then
    sortList $*
fi


