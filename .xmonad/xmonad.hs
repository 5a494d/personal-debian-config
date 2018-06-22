import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

main = xmonad $ defaultConfig {
	terminal = "rxvt-unicode" ,
	focusedBorderColor = "#7BCA24" ,
	normalBorderColor = "#4C5248" ,
	modMask = mod4Mask ,
	borderWidth = 1 ,
	startupHook = setWMName "LG3D"
  }
  `additionalKeys`
    [
        ((mod4Mask, xK_p ), spawn "dmenu_run -fn 'Monaco-11'")
      , ((mod4Mask, xK_b ), spawn "feh --recursive --randomize --bg-fill /home/zim/Pictures/wallpapers/*")
      , ((mod4Mask, xK_s ), spawn "scrot '%Y-%m-%d_%H.%m.%S_$wx$h.png' -e 'mv $f /home/zim/Pictures/screenshot/'")
      , ((mod4Mask, xK_F12),  spawn "/bin/systemctl poweroff -i")
      , ((mod4Mask, xK_F11),  spawn "/bin/systemctl reboot -i")
    ]
