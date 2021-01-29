#! /bin/bash
#cau a
echo "Nhap duong dan thu muc: "
read dir
if [ -d $dir ]
then
	echo "Thu muc ton tai "
else
	echo "Thu muc ko ton tai "
	exit 0
fi

#cau b 
cd $dir
rm -rf *

#cau c
mkdir BTTL BTTH

#cau d
mkdir BTTL/BTTL{1..9} BTTH/BTTH{1..9}

#cau e, f, h
for (( i = 1 ; i <= 9 ; i++ ))
do
    touch BTTL/BTTL$i/18126035.sh
    chmod a+x BTTL/BTTL$i/18126035.sh
    echo "#! /bin/bash" >> BTTL/BTTL$i/18126035.sh
    echo "/*====================================" >> BTTL/BTTL$i/18126035.sh
    echo "Ho va ten      : Dinh Viet Trung" >> BTTL/BTTL$i/18126035.sh 
    echo "MSSV           : 18126035" >> BTTL/BTTL$i/18126035.sh
    echo "Ma bai tap     : BTTH2" >> BTTL/BTTL$i/18126035.sh
    echo "=====================================*/" >> BTTL/BTTL$i/18126035.sh
done

for (( i = 1 ; i <= 9 ; i++ ))
do
    touch BTTH/BTTH$i/18126035.sh
    chmod a+x BTTH/BTTH$i/18126035.sh
    echo "#! /bin/bash" >> BTTH/BTTH$i/18126035.sh
    echo "/*===================================" >> BTTH/BTTH$i/18126035.sh
    echo "Ho va ten      : Dinh Viet Trung" >> BTTH/BTTH$i/18126035.sh 
    echo "MSSV           : 18126035" >> BTTH/BTTH$i/18126035.sh
    echo "Ma bai tap     : BTTH2" >> BTTH/BTTH$i/18126035.sh
    echo "====================================*/" >> BTTH/BTTH$i/18126035.sh
done
#cau g
tree




