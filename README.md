
step 1:  make both files executable:

chmod +x makeVideo.sh
chmod +x ffmpeg

step 2:  get the list of available options

./makeVideo.sh -h       >>>> shows all options/help


Usage: -d [relative or absolute path to image directory -- default is .]

       -f [framerate -- default is 30]

       -o [path to output file -- default is output.mp4]

       -c [codec -- default is libx264]

       -l [lossless flag, will switch to h265 and ultrafast preset and CRF=0]

       -p [compression preset, possible values are ultrafast, superfast, veryfast, faster, fast, medium (default), slow, slower, veryslow   Faster is less compression]

       -P [pixel format, default is yuv420p ]

       -i [image format string.  Default is 25.png ]

       -C [CRF, Constant Rate Factor, defines compression quality.  range of 0-51, 0 is lossless.  default is 0]


examples:  

./makeVideo.sh      --    will take all sequentially numbered .png files in the current directory and output them as a medium-quality h.264 mp4 file called output.mp4 

./makeVideo.sh -o hello.mp4 -- same encoding, output the video as 'hello.mp4' 

./makeVideo.sh -d ./images/ -i images0000.png -- uses images from the ./images directory with the file name format images0000.png, images0001.png, etc. 

./makeVideo.sh -c libx265 -p ultrafast   -- uses the h.265 codec with a CRF of 10 and the 'ultrafast' compression preset 


you can copy those files into other directories for convenience, or just use them wherever they are on your computer.  Just keep them together.
next update will install it as a binary on your computer for maximum easyness.