#! /bin/bash

# bai 1: ham kiem tra duong dan ton tai
isExist(){

    dir="$1"
    if test -d && test -e $dir ; then
	echo "Duong dan ton tai"
    else
	echo "Duong dan khong ton tai!"
	exit 1
    fi
}

#kiem tra co phai la duong dan
isDir(){
    dir="$1"
    if [ -d $dir ] ; then
	echo "Duong dan ton tai"
    else
	echo "Duong dan khong ton tai!"
	exit 1
    fi
}
#kiem tra dau vao la file hay khong
isFile(){

    file="$1"
    if [ -e $file ] ; then
	echo "File ton tai"
    else
	echo "File khong ton tai!"
	exit 1
    fi
}
#lay phan mo rong cua file
getExtension(){
    file="$1"
    echo "${file##*.}"
    
}
#lay ten file
getFileName(){
    file="$1"
    fileName=${file##*/}
    echo "${fileName%.*}"
}

#thong tin ve file
getFileInfo(){
    file="$1"
    
    #ten file
    echo "Ten file:" getFileName $file

    #phan mo rong
    echo "phan mo rong: " getgetExtension $file
    #loai file
    
    echo "loai file ${file##*.}"
    #so tu cua file:
    echo "so tu trong $file"
    cat $file | wc -w
    
    #so ky tu:
    echo "so ky tu trong $file"
    cat $file | wc -c $file

    #so dong
    echo "so dong trong $file"
    cat $file | wc -l $file
}

#nhap vao duong dan tra duong dan co ton tai hay khong

display(){

    dir="$1"
    isExist $dir
    getFileInfo $dir

    if [ -d $dir ] ; then
	echo "day la thu muc"
	ls -l $dir
    fi
}

display /home/trungg
