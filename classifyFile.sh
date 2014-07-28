#!/bin/bash
#
# Created by Marco Esposito M. <marco.esposito@gmail.com> 
# on 2014/07/27
#
# Script to move images and videos. File are moved according the 
# output of "file" command. 
# file is invoked with the parameter "--mime-type".
#

# check unset variables
set -o nounset

# using a date as suffix in the name of the directories
date=$(date '+%Y%m%d_%H%M%S')

# create names of the folders
images=Images_$date
videos=Videos_$date

# create folders Images and Videos
mkdir $images $videos

# check exit status of the mkdir command
if [ $? -ne 0 ]; then 
    echo "mkdir command failed"
    exit 1
fi

# analize files in current directory
file --mime-type * | while read line; do
    file=$(echo $line | cut -d: -f1)
    mime=$(echo $line | cut -d: -f2 | tr -d ' ')
    # use only the first part of the mime type string
    case ${mime%%/*} in 
	image)
	    mv -v "$file" $images
	    ;;
	video)
	    mv -v "$file" $videos
	    ;;
	*)
     
	    echo "Skip $file ($mime)"
	    ;;
    esac
done
