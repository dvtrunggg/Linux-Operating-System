#! /bin/bash

#cau 1: tao file 18126035_BTTH05.sh

#cau 2: ham showHelp hien thi noi dung
showHelp(){
    echo "Usage: $0 [-a|--all] [-d|--display][-s|--sum][-p|--product] input_file output_file"
}

#cau 3: ham show so luong so nguyen co trong tham so dau vao
lengthList(){
   echo "So luong so nguyen: $#"
}

#cau 4: ham hien thi do dai day so va cac phan tu cua day so do
displayList(){
    lengthList $*
    echo "Cac phan tu cua day so: $*"
}
#cau 5: ham tinh tong day so nguyen
sumInt(){
    local sum=0
    for i in $* ; do
	((sum=sum+i))
    done
    echo "Tong day so: $sum"
}

#cau 6: ham tinh tich cac so nguyen
productInt(){
    local mul=1
    for i in $* ; do
	((mul=mul*i))
    done
    echo "Tich day so: $mul"
}


#cau 7: dinh nghia bien toan cuc voi khoi tao false
FLAG_DISPLAY=false
FLAG_SUM=false
FLAG_PRODUCT=false

#cau 8: ham hien thi thong tin tu tham so dau vao
showInfos(){
    if $FLAG_DISPLAY ; then
	displayList $*
    fi

    if $FLAG_SUM ; then
	sumInt $*
    fi

    if $FLAG_PRODUCT ; then
	productInt $*
    fi
    
}


#cau 9:
#theo usage: $0 [option] fileIn fileOut

#ham readFile kiem tra duong dan ton tai hay khong, ton tai: doc tung dong va luu vao file dau ra theo tuy chon lenh, else: out va thong bao
readFile() #file                                                     
{
   local file=$1
   if ! [ -f $file ]
   then
      echo "$file khong hop le"
      exit 1
   fi
}

#ham process nhan dau vao la file dau vao va file dau ra

process() #inputFile #outputFile                               
{
   I_file=$1
   O_file=$2
   readFile $I_file
   showInfos $(cat $I_file) > $O_file
}

#cau 10: tuy chon cho script
process $1 $2
if [ $# -lt 1 ]
then
   showHelp
fi
while [ $# -ge 1 ]
do
   case "$1" in
	"-d"|"--display") FLAG_DISPLAY=true; shift 1;;
     "-s"|"--sum") FLAG_SUM=true; shift 1;;
     "-p"|"--product") FLAG_PRODUCT=true; shift 1;;
     "-a"|"--all") FLAG_DISPLAY=true; FLAG_SUM=true; FLAG_PRODUCT=true; shift 1;;
      *) break;;
   esac
done

if [ "$FLAG_DISPLAY" = "false" ]
then
   if [ "$FLAG_SUM" = "false" ]
   then
      if [ "$FLAG_PRODUCT" = "false" ]
      then
         showHelp
      fi
   fi
fi

if (($# != 2))
then
   showHelp
fi

