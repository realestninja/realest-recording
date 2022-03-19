# realest-rectangle

## xrectsel to obtain rectangle
`xrectsel`
-> 496x372+1069+449
size: 496x372
pos: 1069,449

## ffmpeg to record screen area
ffmpeg example code:
`ffmpeg -video_size 676x609 -framerate 25 -f x11grab -i :0.0+1163,451 1.mp4`

## requirements
* keybinding to trigger script
* automatically start recording upon keybinding
* keybinding to stop
* bonus: tray icon or other way of indicating
* notification when video was saved

## ideas
* bash script
* bash script read letter: `read -rsn1`
* `xdotool getwindowfocus getwindowgeometry`
* option to record with audio

## dummy commands
ffmpeg -video_size 2559x1439 -framerate 25 -f x11grab ~/Videos/ffmpeg/test1.mp4
