#Assignment: CS210 Project 1
#File name: findUnused.sh
#Author: Ben Levinsky

#list all files recursively, then from there filter only for image files
#. These are then appended to list called imageFiles
imageFiles=$(ls -R | grep -E "(jpg|png|gif|jpeg)")

#find all text files within current directory and append to list called textFiles
textFiles=$(find . | grep -E ".+(txt|json|xml)")

#double for loop that goes through each text file and if image is found there, then set value to true
#if false after every textfile, then print imagefile[name]

for name in $imageFiles; do
    result=1
    for file in $textFiles; do
        grep -q $name $file
        if [ $? -eq 0 ]; then
            result=0
        fi
    done

    if [ $result -eq 1 ]
    then
        echo $name
    fi
done
