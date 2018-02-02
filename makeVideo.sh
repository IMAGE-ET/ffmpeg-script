dflag=
fflag=
directory="."
framerate=30
output="output.mp4"
codec="libx264"
imageFormat="%d.png"
losslessFlag=
lossless=
presetFlag=
preset=
pixelFormatFlag="-pix_fmt"
pixelFormat="yuv420p"
CRF=25
while getopts d:f:o:c:lp:P:C:i:h name
do
    case $name in
    d)	    directory="$OPTARG";;
	
    f)      framerate=$OPTARG;;
    o)      output="$OPTARG";;
    c)      codec="$OPTARG";;
    l)      codec="libx265"
	    presetFlag="-preset"
	    preset="ultrafast"
	    losslessFlag="-x265-params"
	    CRF=0
	    lossless="lossless=1";;
    p)      presetFlag="-preset"
	    preset="$OPTARG";;
    P)      pixelFormat="$OPTARG";;
    C)      CRF=$OPTARG;;
    i)      imageFormat=$OPTARG;;
    h)   printf "
Usage: -d [relative or absolute path to image directory -- default is %s]\n
       -f [framerate -- default is %d]\n
       -o [path to output file -- default is %s]\n
       -c [codec -- default is %s]\n
       -l [lossless flag, will switch to h265 and ultrafast preset and CRF=0]\n
       -p [compression preset, possible values are ultrafast, superfast, veryfast, faster, fast, medium (default), slow, slower, veryslow   Faster is less compression]\n
       -P [pixel format, default is %s ]\n
       -i [image format string.  Default is %d.png ]\n
       -C [CRF, Constant Rate Factor, defines compression quality.  range of 0-51, 0 is lossless.  default is %d]\n

examples:  \n
./makeVideo.sh      --    will take all sequentially numbered .png files in the current directory and output them as a medium-quality h.264 mp4 file called output.mp4 \n
./makeVideo.sh -o hello.mp4 -- same encoding, output the video as 'hello.mp4' \n
./makeVideo.sh -d ./images/ -i images%04d.png -- uses images from the ./images directory with the file name format images0000.png, images0001.png, etc. \n
./makeVideo.sh -c libx265 -p ultrafast   -- uses the h.265 codec with a CRF of 10 and the 'ultrafast' compression preset \n
./makeVideo.sh 
" $directory $framerate $output $codec $pixelFormat $CRF
          exit 2;;
    esac
done


./ffmpeg -r $framerate -i $imageFormat -vcodec $codec $presetFlag $preset $losslessFlag $lossless -crf $CRF  $pixelFormatFlag $pixelFormat $output