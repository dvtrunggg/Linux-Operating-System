#! /bin/bash
#cau 1
#1.
cat ~
mkdir MidTerm_18126035
cd MidTerm_18126035

#2.
umask -S | u=rx,g=r

#3
mkdir MidTerm
#4
touch newfile.txt
#5
ls -l newfile.txt
#6
echo "Day la bai thi giua ky cua 18126035" >> newfile.txt
#7
cat newfile.txt
#8
mv newfile.txt Midterm
mv newfile.txt ketqua.txt
#9
chmod 700 ketqua.txt
#10
grep Thi ketqua.txt 
cut -f1-2 ketqua.txt
touch giuaky.txt
cut -f 1,2,4 ketqua.txt >> giuaky.txt


