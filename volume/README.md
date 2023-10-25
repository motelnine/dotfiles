## Simple Volume Control Script
A simple bash script to control the output volume which uses pulse audio to adjust volume and toggle mute settings.

## Installation 
Install  `pavucontrol`:
```
sudo pacman -S extra/pavucontrol
```

Copy  `volume.sh` to `/bin/volume`:

```
sudo cp volume.sh /bin/volume
```

To use this control script with i3 add the following lines to your i3 config file:
```
bindsym XF86AudioMute exec --no-startup-id volume toggle
bindsym XF86AudioLowerVolume exec --no-startup-id /bin/volume up
bindsym XF86AudioRaiseVolume exec --no-startup-id /bin/volume down
```

## Usage

Increase volume:
```
volume.sh up
```

Decrease volume:
```
volume.sh down
```

Toggle Mute:
```
volume.sh toggle
```

Enable Mute:
```
volume.sh mute
```
Disable Mute:
```
volume.sh unmute
```
