#!/bin/bash
echo "Hello World"

MESSAGE="Hello world"
echo $MESSAGE


echo "Nhap so nguyen: "
read number
if [[ $number -gt 0 ]]
then
    echo "$number la so duong"
elif [[ $number -lt 0 ]]
then
     echo "$number la so am "
else
    echo "$number la so 0"
fi

t=$(( $number % 2))

if [ $t -eq 0 ]
then
    echo "$number la so chan"
else
    echo "$number la so le"
fi

echo "cac so tu 0 den $number: "
i=0
while [ $i -le $number ]
do
    echo $i
    i=$(($i+1))
done

j=0
while [ $j -ge $number ]
do
    echo $j
    j=$(($j-1))
done
