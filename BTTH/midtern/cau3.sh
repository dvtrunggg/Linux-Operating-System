#! /bin/bash

mkdir Cau3
cd Cau3
touch {pink,white,yellow,blue,green,purple,orange,red}_{rose,lily,daisy,tulip,sunflower,iris,orchid,violet,jasmine,jonquil}
ls |wc -l

#1.
ls *{orchid,jonquil}*
#2
ls *_{s,v}*
#3
ls green*y
#4
ls !(*violet.txt)
#5
ls !(*violet.txt)


