#! /bin/bash

echo "Enter file's name"
read file
#ham hien thi thong tin file
getFileInfo()
{
    #file name
    local temp="${file##*/}"
    echo "ten file: ${temp%.}"

    #ext
    echo "phan mo rong: ${file##*.}"

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