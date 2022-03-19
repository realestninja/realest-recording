MENU="rofi -i -dmenu -u 1,2,3,4"

function get_date_string_for_filename(){
	# printf -v date '%(%Y-%m-%d)T\n' -1
}

function call_ffmpeg(){
	# $1 -> resolution
	# $2 -> screen position
	# ffmpeg -video_size $1 -framerate 25 -f x11grab -i :0.0+${2} scripted.mp4
	get_date_string_for_filename
}

function get_resolution_and_position_as_array(){
	xrectsel_string=$(xrectsel)
	IFS='+'
	read -a $1 <<< "$xrectsel_string"
}

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
	get_resolution_and_position_as_array resolution_and_position
	resolution=${resolution_and_position[0]}
	position="${resolution_and_position[1]}","${resolution_and_position[2]}"
	call_ffmpeg $resolution $position
	;;
esac
