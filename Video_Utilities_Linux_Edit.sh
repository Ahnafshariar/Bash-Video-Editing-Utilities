#!/usr/bin/bash

echo "Welcome to Video Editing Utilities" 

PS3="Please choose from the options below: "

options=("Video convert to MP4" "Extract Video Frames" "Shorten Video" "Extract Audio" "Rotate Video" "Quit")

while true; do

  select opt in "${options[@]}"

  do
	case $opt in
	    "Video convert to MP4")
		echo "Convert video to MP4 selected"
		echo "Please enter the video name: "
		read -p "Video: " name
		ffmpeg -i $name -vcodec mpeg4 -strict -2  video_converted.mp4
		break
		;;
	     "Extract Video Frames")
		echo "Extract video frames selected"
                echo "Please enter the video name: "
                read -p "Video: " name
		mkdir images
                ffmpeg -y -i $name -an -r 10 images/img%03d.bmp
               	break
		;;
	      "Shorten Video")
                echo "Shorten video selected"
                echo "Please enter the video name: "
                read -p "Video: " name
                ffmpeg -i $name -strict -2 -vf "select=gt(scene\,0.003),setpts=N/(25*TB)" video_shortened.mp4
                break
                ;;
	      "Extract Audio")
                echo "Extract audio selected"
                echo "Please enter the video name: "
                read -p "Video: " name
                ffmpeg -i $name -vn -ac 2 -ar 44100 -ab 320k -f mp3 video_extracted_audio.mp3
                break
                ;;
	      "Rotate Video")
                echo "Rotate video selected"
                echo "Please enter the video name: "
                read -p "Video: " name
                ffmpeg -i $name -vf transpose=0 video_rotate.mp4
                break
                ;;
	     "Quit")
		exit 0
		;;
	     *) echo "Invalid option $Reply";;
	esac
  done
done
