#! /bin/bash

sum=0
for i in $* ; do
    sum=$((sum+i))
done



if ! [ $# -eq 0 ] ; then
    avg=$((sum/$#))

    echo "Diem trung binh cua $# thanh phan [$@] la"
    echo $avg | bc -l | xargs printf "%.2f"
else
    echo "Khong co diem thanh phan"
fi