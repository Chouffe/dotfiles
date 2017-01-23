import           Graphics.X11.ExtraTypes.XF86
import           System.IO
import           XMonad
import           XMonad.Actions.UpdatePointer (updatePointer)
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Layout.Maximize
import           XMonad.Layout.ToggleLayouts
import           XMonad.Util.EZConfig         (additionalKeys)
import           XMonad.Util.Run              (spawnPipe)

-- Use urxvt as terminal
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

    -- Starts xmobar
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts myLayout
        -- , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "yellow" "" . shorten 50
                        }
                        -- Follow mouse to selected buffer
                        >> updatePointer (0.5, 0.5) (0.5,0.5)

        -- Rebind Mod to the Windows key
        , modMask = mod4Mask

        -- Rebind terminal to `term`
        , terminal = term

        -- Background color for focused window
        , focusedBorderColor = "#ffff00"
        } `additionalKeys`

        -- Screensaver
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")

        -- Terminal
        , ((mod4Mask, xK_Return), spawn term)

        -- Layout toggle
        , ((mod4Mask .|. controlMask, xK_space), sendMessage ToggleLayout)
        , ((mod4Mask, xK_z), sendMessage (Toggle "Full"))

        -- Screenshots
        -- , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        -- , ((mod4Mask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask .|. shiftMask, xK_s), spawn "scrot ~/Pictures/screen_%Y-%m-%d-%H-%M-%S.png -d 1") -- with a delay of 1 second
        , ((mod4Mask, xK_s),               spawn "scrot ~/Pictures/screen_%Y-%m-%d-%H-%M-%S.png -d 1") -- with a delay of 1 second
        -- , ((0, xK_Print), spawn "scrot")

        -- Backlight
        , ((0                     ,xF86XK_MonBrightnessUp),  spawn "xbacklight -inc 10")
        , ((0                     ,xF86XK_MonBrightnessDown),  spawn "xbacklight -dec 10")

        -- Sound
        , ((0                     ,xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 5%-")
        , ((0                     ,xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 5%+")
        , ((0                     ,xF86XK_AudioMute), spawn "amixer -D pulse sset Master toggle")
        ]
