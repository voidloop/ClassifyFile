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

# analize files in current directory
file --mime-type * | while read line; do
    file=$(echo $line | cut -d: -f1)
    mime=$(echo $line | cut -d: -f2 | tr -d ' ')
    # use only the first part of the mime type string
    case ${mime%%/*} in 
	image)
	    mv -v "$file" Images
	    ;;
	video)
	    mv -v "$file" Videos
	    ;;
	*)
     
	    echo "Skip $file ($mime)"
	    ;;
    esac
done
