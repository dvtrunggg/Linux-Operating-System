#!/ bin/bash

#kiem tra so luong tham so
paramaterCheck(){
    if [ $# -lt 2 ] ; then
	#hien thi huong dan su dung
	echo "Usage: fileInput fileOutput"    
	exit 1
    fi
}
#kiem tra file dau vao hop le
fileCheck(){
    file="$1"
    if ! [ -f $file ] ; then
	echo "Erro!"
	exit 1
    fi
}
#kiem tra file dau ra ton tai hay chua, neu chua thi tao file moi
fileExist(){
    fileOut="$2"
    if ! [ -e $fileOut ] ; then
	touch $fileOut
    else
	echo "$fileOut co ton tai"
    fi

}
# kiem tra dau vao va xu ly: -n: in dong dau tien trong file
# -e: ma hoa dong = ROT13alpha va luu vao file dau ra

while [ $# -gt 1 ] ; do
    case "$1" in
	"-n") cat "$1" | head shift;;
	"-e") cat "$1" | tr 'A-Za-z' 'N-ZA-Mn-za-m' >> "$2" shift;;
	"*") echo "Khong co gi" break ;;
    esac
done


