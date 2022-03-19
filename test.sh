MENU="rofi -i -dmenu -u 1,2,3,4"

start_recording="Fullscreen"
record_rectangle="Selected area"

CHOICE=`$MENU -l 10 -p "Choose recording method" << EOF
$start_recording
$record_rectangle
EOF`

case "$CHOICE" in
    $start_recording)
	echo $start_recording
	resolution=$(xdpyinfo | awk '/dimensions/{print $2}')
	ffmpeg -video_size $resolution -framerate 25 -f x11grab -i :0.0 fullscreen_scripted.mp4
	;;
    $record_rectangle)
	xrectsel_string=$(xrectsel)
	echo $xrectsel_string
	IFS='+'
	read -a strarr <<< "$xrectsel_string"
	resolution=${strarr[0]}
	position="${strarr[1]}","${strarr[2]}"
	echo $resolution
	echo $position
	ffmpeg -video_size $resolution -framerate 25 -f x11grab -i :0.0+${position} scripted.mp4
	;;
esac
