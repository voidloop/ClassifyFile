ClassifyFile
============

A Bash script to classify videos and images in different directories.

## How this script works
You can use this script to split images and videos mixed in the same directory. Two directories will be created during the execution of this script in the working directory: "Images_<current-date>" and "Videos_<current-date>". After the script execution you will find your images in the first directory and your videos in the second one. Other files will be left untouched in working directory. An example follows.

Change current working directory and list it:

```
% cd ~/MyDir && ls -1
FILE001.txt
FILE002.txt
IMG001.jpg
IMG002.jpg
VID001.mp4
VID002.mp4
```

Run the script: 

```
% ~/ClassifyFile/classifyFile.sh           
Skip FILE001.txt (application/x-empty)
Skip FILE002.txt (application/x-empty)
IMG001.jpg -> Images_20140729_161603/IMG001.jpg
IMG002.jpg -> Images_20140729_161603/IMG002.jpg
Skip Images_20140729_161603 (application/x-directory)
VID001.mp4 -> Videos_20140729_161603/VID001.mp4
VID002.mp4 -> Videos_20140729_161603/VID002.mp4
Skip Videos_20140729_161603 (application/x-directory)
```

List working directory again:

```
% ls -1                                   
FILE001.txt
FILE002.txt
Images_20140729_161603
Videos_20140729_161603
```
