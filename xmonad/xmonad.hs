import           Graphics.X11.ExtraTypes.XF86
import           System.IO
import           XMonad
import           XMonad.Actions.UpdatePointer (updatePointer)
import           XMonad.Hooks.DynamicLog      (xmobar)
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Layout.Fullscreen     (fullscreenFull)
import           XMonad.Layout.NoBorders      (noBorders, smartBorders)
import           XMonad.Layout.PerWorkspace   (onWorkspace)
import           XMonad.Layout.ResizableTile
import           XMonad.Layout.Spacing        (smartSpacing)
import           XMonad.Layout.ToggleLayouts
import           XMonad.ManageHook            (composeAll, doShift, resource,
                                               (-->), (=?))
import           XMonad.Util.EZConfig         (additionalKeys)
import           XMonad.Util.Run              (spawnPipe)

-- Use urxvt as terminal
myTerm        = "urxvt"
myBorderWidth = 2

myLayout = workSpace0 $ workSpace1 $ defaultWorkspace
  where
     -- Default tiling algorithm partitions the screen into two panes
     tiled          = smartSpacing 5 $ ResizableTall nmaster delta ratio []
     tiledSpace     = smartSpacing 60 $ ResizableTall nmaster delta ratio []
     fullScreen     = noBorders $ fullscreenFull Full
     fullTile       = ResizableTall nmaster delta ratio []
     borderlessTile = noBorders fullTile
     -- The default number of windows in the master pane
     nmaster        = 1
     -- Default proportion of the screen taken up by main pane
     -- Golden ratio
     ratio          = toRational (2/(1 + sqrt 5 :: Double))
     -- Percent of screen to increment by when resizing panes
     delta          = 5/100

     -- Workspace layouts
     workSpace0       = onWorkspace (myWorkspaces !! 0) $
       toggleLayouts fullScreen $
         avoidStruts (tiled ||| Mirror tiled ||| tiledSpace) ||| avoidStruts fullTile

     workSpace1       = onWorkspace (myWorkspaces !! 1) $
       toggleLayouts fullScreen $
         avoidStruts (tiledSpace ||| fullTile) ||| fullScreen

     defaultWorkspace = toggleLayouts fullScreen $
       avoidStruts (tiledSpace ||| tiled ||| fullTile)


myLogHook h =
  dynamicLogWithPP xmobarPP
    { ppOutput          = hPutStrLn h
    , ppCurrent         = xmobarColor color15 background    . pad
    , ppVisible         = xmobarColor color14 background    . pad
    , ppHidden          = xmobarColor color14 background    . pad
    , ppHiddenNoWindows = xmobarColor background background . pad
    , ppTitle           = xmobarColor color15 background    . shorten 40 . pad
    }
    -- Follow mouse to selected buffer
    >> updatePointer (0.5, 0.5) (0.5,0.5)

-- ------------------------------------------------
-- Application Specific Rules
-- ------------------------------------------------

-- myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
myWorkspaces = ["i", "ii", "iii", "iv", "v", "vi"]

myManageHook =
  composeAll [resource =? "spotify" --> doShift (myWorkspaces !! 3)
             , resource =? "dmenu" --> doFloat
             , manageDocks
             ]
newManageHook = myManageHook <+> manageHook defaultConfig

main = do

    -- Starts xmobar
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
      { manageHook         = newManageHook
      , layoutHook         = smartBorders myLayout
      , logHook            = myLogHook xmproc
      , modMask            = mod4Mask
      , terminal           = myTerm
      , workspaces         = myWorkspaces
      , borderWidth        = myBorderWidth
      , focusedBorderColor = color8
      , normalBorderColor  = color0
      }

----------------------------------------
-- Keyboard Options
----------------------------------------

      `additionalKeys`

        -- Screensaver
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")

        -- Browser
        , ((mod4Mask .|. shiftMask, xK_b), spawn "chromium-browser")


        -- Media
        -- FIXME
        , ((mod4Mask, xK_F7), spawn "~/.xmonad/scripts/spotify-cli previous")
        , ((mod4Mask, xK_F8), spawn "~/.xmonad/scripts/spotify-cli play-pause")
        , ((mod4Mask, xK_F9), spawn "~/.xmonad/scripts/spotify-cli next")
        -- , ((0, 0x1008ff16),   spawn "~/.xmonad/scripts/spotify-cli previous")
        -- , ((0, 0x1008ff14),   spawn "~/.xmonad/scripts/spotify-cli play-pause")
        -- , ((0, 0x1008ff17),   spawn "~/.xmonad/scripts/spotify-cli next")

        -- Music
        , ((mod4Mask .|. shiftMask, xK_s), spawn "spotify")

        -- Terminal
        , ((mod4Mask, xK_Return), spawn myTerm)

        -- Layout toggle
        , ((mod4Mask .|. controlMask, xK_space), sendMessage ToggleLayout)
        , ((mod4Mask, xK_z),                     sendMessage (Toggle "Full"))

        -- Screenshots
        -- , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        -- , ((mod4Mask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask .|. shiftMask, xK_s), spawn "scrot ~/Pictures/screen_%Y-%m-%d-%H-%M-%S.png -d 1") -- with a delay of 1 second
        , ((mod4Mask, xK_s),               spawn "scrot ~/Pictures/screen_%Y-%m-%d-%H-%M-%S.png -d 1") -- with a delay of 1 second
        -- , ((0, xK_Print), spawn "scrot")

        -- Backlight
        , ((0, xF86XK_MonBrightnessUp),   spawn "xbacklight -inc 10")
        , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")

        -- Sound
        , ((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 5%-")
        , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 5%+")
        , ((0, xF86XK_AudioMute),        spawn "amixer -D pulse sset Master toggle")
        ]

-- Color Theme
background = "#181512"
foreground = "#D6C3B6"
color0     = "#332d29"
color8     = "#817267"
color1     = "#8c644c"
color9     = "#9f7155"
color2     = "#746C48"
color10    = "#9f7155"
color3     = "#bfba92"
color11    = "#E0DAAC"
color4     = "#646a6d"
color12    = "#777E82"
color5     = "#766782"
color13    = "#897796"
color6     = "#4B5C5E"
color14    = "#556D70"
color7     = "#504339"
color15    = "#9a875f"
