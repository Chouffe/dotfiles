import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86
import XMonad.Layout.Maximize
import XMonad.Layout.ToggleLayouts

term = "urxvt"

myLayout = toggleLayouts Full tiled ||| toggleLayouts Full (Mirror tiled)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts myLayout
        -- , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "yellow" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = term
        , focusedBorderColor = "#ffff00"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((mod4Mask, xK_Return), spawn term)
        , ((mod4Mask .|. controlMask, xK_space), sendMessage ToggleLayout)
        , ((mod4Mask, xK_z), sendMessage (Toggle "Full"))
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0                     ,xF86XK_MonBrightnessUp),  spawn "xbacklight -inc 10")
        , ((0                     ,xF86XK_MonBrightnessDown),  spawn "xbacklight -dec 10")
        , ((0                     ,xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 5%-")
        , ((0                     ,xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 5%+")
        , ((0                     ,xF86XK_AudioMute), spawn "amixer -D pulse sset Master toggle")
        , ((0, xK_Print), spawn "scrot")
        ]
