#! /bin/bash

#cau 1: tao file 18126035_BTTH04.sh

#cau 2: ham showHelp hien thi tro giup
showHelp()
{
    echo "Usage: .$0 [-h|--help] [-a|--all] [-f|--find filename] [-c|--count filename] dir"
}

#cau 3: dau vao la duong dan dir, ktra duong dan ton tai hay ko
#Neu ton tai: hien thi thong bao va thoat khoi ham
#Neu khong ton tai: hien thi tat ca cac file va thu muc con trong duong dan do

showAllFiles() {
    local dir="$1"
    if [ -d "$dir" ] ; then
	echo "$dir is exist"
	tree "$dir"       
    else
	echo "$dir is not exist!"
	return 1
    fi
}

#cau 4: dau vao la duong dan thu muc dir($1) va ten file($2)
#duyet cac thu muc con va hien thi duong dan cua fileName 
findFile() {
    
    local dir="$1"  #duong dan thu muc ($1)
    local fileName="$2"   # ten file ($2)

    #dung lenh find de hien thi duong dan cua file 
    find "$dir" -name "$fileName"
    
}

#cau 5: ham kiem tra file co ton tai hay ko
# neu ko ton tai: hien thi thong bao 
# neu ton tai nhung ko co quyen doc: hien thi thong bao
# con lai: hien thi ten file (loai bo duong dan) va hien thi so dong trong file

countLines(){
    local file="$1"

    #kiem tra file co quyen read hay ko
    #xem quyen cua file bang ls -l. vd: -rwxrwxrwx 1 trungg trungg 1314 Aug 14 04:07 18126035_BTTH03.sh
    #trong do: 1: ky tu "-", 2: ky tu "r", 3: ky tu "w",...
    jur=$(ls -l $file | cut -c2) #=>ta lay dc quyen doc cua user
    
    if [ -f "$file" ] ; then
	if [ "$jur" != "r" ] ; then    #neu file nay ko co quyen doc
	    echo "File nay khong co quyen doc"

	#truong hop file co quyen doc    
	else
	    echo "Ten file: "
	    echo "${file##*/}"
	    echo "So dong trong file nay: "
	    wc -l $file
	fi

    #truong hop ko ton tai file
    else
	echo "File is not exist!"
	
    fi
         	    
}	

#cau 6: dinh nghia cac flag =false
flag_countline=false
flag_find=false
flag_all=false

#cau 7: ham hien thi thong tin theo yeu cau de bai
showInfos(){
    if $flag_countline ; then
	countLines $*
    fi

    if $flag_find ; then
	findFile $*
    fi

    if $flag_all ; then
	showAllFiles $*
    fi

}

#cau 8: xu ly tuy chon
while [ $# -ge 0 ] ; do
    case "$1" in
	-h|--help) showHelp
		   break;;
	-a|--all) flag_all=true
		  shift;;
	-f|--find) flag_find=true
		   shift;;
	-c|--count) flag_countline=true
		     shift;;
	*) showHelp
	   break;;
    esac
done
showInfos $*

	
