#! /bin/bash

#cau 1: tao file 18126035_BTTH06_2.sh

#cau 2: ham dem so tu 
countCharacter ()
{
    local a="$1"
    echo "So tu: $(wc -w $a)"
}

#cau 3: ham liet ke cac tu
listCharacter ()
{
    local a="$1"
    cat $1
}

#cau 4: ham dem so lan cua 1 tu 
countWord ()
{
    local a="$1"
    STRING="$*"
    character=${STRING#*$1}
    echo "So luong tu |"$character" | co trong file : $(grep -o $character $a | wc -l) "
    
}

#cau 5: test
touch test.txt
echo "Bonjour mon nom est Trung" > test.txt

countCharacter test.txt
listCharacter test.txt
countWord test.txt on
rm test.txt
