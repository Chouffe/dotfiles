import           Data.Default                 (def)
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

-- ------------------------
-- Config
-- ------------------------
myTerm        = "urxvt"
myFileManager = "nautilus"
myBrowser     = "firefox"
myDevBrowser  = "chromium-browser"
myMusic       = "spotify"
myBorderWidth = 2
xmonadPath    = "/home/chouffe/.xmonad/"
scripts       = xmonadPath ++ "scripts/"

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
     delta          = 3/100

     -- Workspace layouts
     workSpace0       = onWorkspace (myWorkspaces !! 0) $
       toggleLayouts fullScreen $
         avoidStruts (tiled ||| Mirror tiled ||| tiledSpace) ||| avoidStruts fullTile

     workSpace1       = onWorkspace (myWorkspaces !! 1) $
       toggleLayouts fullScreen $
         avoidStruts (fullTile ||| tiledSpace) ||| fullScreen

     defaultWorkspace = toggleLayouts fullScreen $
       avoidStruts (fullTile ||| tiled ||| tiledSpace)

myLogHook h =
  dynamicLogWithPP xmobarPP
    { ppOutput          = hPutStrLn h
    , ppCurrent         = xmobarColor color15 background    . pad . wrap "[" "]"
    , ppVisible         = xmobarColor color14 background    . pad . wrap "(" ")"
    , ppHidden          = xmobarColor color14 background    . pad
    , ppHiddenNoWindows = xmobarColor background background . pad
    , ppTitle           = xmobarColor color10 background     . shorten 40 . pad
    , ppLayout          = xmobarColor color1 background     . pad . myLayoutPrinter
    , ppUrgent          = xmobarColor urgentColor background . pad
    -- ws: workspaces, l: layout, t: title and rest
    , ppOrder           = \(ws:l:t:_) -> [l, ws, t]
    , ppWsSep           = "<fc=" ++ color8 ++ ">•</fc>"
    , ppSep             = "<fc=" ++ color8 ++ ">|</fc>"
    }
    -- Follow mouse to selected buffer
    >> updatePointer (0.5, 0.5) (0.5,0.5)

myLayoutPrinter :: String -> String
myLayoutPrinter layout =
  case layout of
    "ResizableTall"                 -> icon "tall.xbm"
    "Full"                          -> icon "layout_full.xbm"
    "SmartSpacing 5 ResizableTall"  -> icon "layout_tall.xbm"
    "SmartSpacing 60 ResizableTall" -> icon "layout_tall.xbm"
    _                               -> icon "grid.xbm"
  where icon i = "<icon=" ++ iconPath i ++ "/>"
        iconPath s = xmonadPath ++ "/icons/" ++ s


-- ------------------------------------------------
-- Application Specific Rules
-- ------------------------------------------------
myWorkspaces = ["i", "ii", "iii", "iv"]
-- myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
-- myWorkspaces = ["i", "ii", "iii", "iv", "v", "vi"]

myManageHook =
  composeAll [ resource =? myMusic --> doShift (myWorkspaces !! 3)
             , resource =? "dmenu" --> doFloat
             , resource =? "transmission" --> doShift (myWorkspaces !! 2)
             , resource =? "transmission-gtk" --> doShift (myWorkspaces !! 2)
             , manageDocks
             ]

newManageHook = myManageHook <+> manageHook def

-- ------------------------------------------------
-- External Commands
-- ------------------------------------------------

dmenuArgs :: String -> [String]
dmenuArgs title = [ "-i"
                  , "-nb", quote background
                  , "-nf", quote color2
                  , "-sb", quote color1
                  , "-sf", quote foreground
                  , "-fn", quote font
                  , "-p",  quote title
                  ]
  where quote s = "'" ++ s ++ "'"

dmenuRunCmd :: String
dmenuRunCmd = "dmenu_run " ++ (unwords $ dmenuArgs "Run Program:")

passmenuRunCmd :: String
passmenuRunCmd = scripts ++ "passmenu " ++ (unwords $ dmenuArgs "Password:")

clipmenuRunCmd :: String
clipmenuRunCmd = scripts ++ "clipmenu " ++ (unwords $ dmenuArgs "Clipboard:")

musicPlayerCmd :: String -> String
musicPlayerCmd cmd = scripts ++ "shpotify " ++ cmd

screenshotCmd :: String
screenshotCmd = "scrot"

screenshotFolder :: String
screenshotFolder = "~/Pictures/"

----------------------------------------
-- Keyboard Options
----------------------------------------
myKeys =
  [ -- Screensaver
    ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
  -- Browser
  , ((mod4Mask .|. shiftMask, xK_b), spawn "chromium-browser")

  -- Dmenu
  , ((mod4Mask, xK_p), spawn dmenuRunCmd)

  -- PassMenu
  , ((mod4Mask .|. shiftMask, xK_p), spawn passmenuRunCmd)

  -- Clipmenu
  , ((mod4Mask, xK_y), spawn clipmenuRunCmd)
  , ((mod4Mask, xK_c), spawn clipmenuRunCmd)

  -- Gmrun
  , ((mod4Mask, xK_P), spawn "gmrun")

  -- Media
  , ((0, xF86XK_AudioPrev),  spawn $ musicPlayerCmd "prev")
  , ((0, xF86XK_AudioNext),  spawn $ musicPlayerCmd "next")
  , ((0, xF86XK_AudioPlay),  spawn $ musicPlayerCmd "play")
  , ((0, xF86XK_AudioPause), spawn $ musicPlayerCmd "pause")

  -- Music
  , ((mod4Mask .|. shiftMask, xK_m), spawn myMusic)

  -- Terminal
  , ((mod4Mask, xK_Return), spawn myTerm)

  -- Files
  , ((mod4Mask, xK_f), spawn myFileManager)

  -- Browser
  , ((mod4Mask, xK_b), spawn myBrowser)
  , ((mod4Mask .|. shiftMask, xK_b), spawn myDevBrowser)

  -- Layout toggle
  , ((mod4Mask .|. controlMask, xK_space), sendMessage ToggleLayout)
  , ((mod4Mask, xK_z),                     sendMessage (Toggle "Full"))

  -- Screenshots
  , ((mod4Mask .|. shiftMask, xK_s), spawn $ screenshotCmd ++ " " ++ screenshotFolder ++ "screen_%Y-%m-%d-%H-%M-%S.png -d 1")
  , ((mod4Mask, xK_s),               spawn $ screenshotCmd ++ " " ++ screenshotFolder ++ "screen_%Y-%m-%d-%H-%M-%S.png -d 1")
  , ((0, xK_Print),                  spawn $ screenshotCmd ++ " -s " ++ screenshotFolder ++ "selection_%Y-%m-%d-%H-%M-%S.png")

  -- Backlight
  , ((0, xF86XK_MonBrightnessUp),   spawn "xbacklight -inc 10")
  , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")

  -- Sound
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 5%-")
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 5%+")
  , ((0, xF86XK_AudioMute),        spawn "amixer -D pulse sset Master toggle")
  ]

-- ------------------------
-- Color Theme
-- ------------------------
color0      = "#332d29"
color1      = "#8c644c"
color2      = "#746C48"
color3      = "#bfba92"
color4      = "#646a6d"
color5      = "#766782"
color6      = "#4B5C5E"
color7      = "#504339"
color8      = "#817267"
color9      = "#9f7155"
color10     = "#9f7155"
color11     = "#E0DAAC"
color12     = "#777E82"
color13     = "#897796"
color14     = "#556D70"
color15     = "#9a875f"
urgentColor = "#ff0000"
background  = "#181512"
foreground  = "#D6C3B6"
font        = "Inconsolata-13"

-- Xmobar Specific
lowColor    = color2
normalColor = color15
highColor   = color10

-- ------------------------
-- Xmonad entry point
-- ------------------------
main = do
    xmproc <- spawnPipe "xmobar"
    spawn $ scripts ++ "clipmenud" -- Starts clipmenud for clipboard management via dmenu
    xmonad $ def
      { manageHook         = newManageHook
      , layoutHook         = smartBorders myLayout
      , logHook            = myLogHook xmproc
      , modMask            = mod4Mask
      , terminal           = myTerm
      , workspaces         = myWorkspaces
      , borderWidth        = myBorderWidth
      , focusedBorderColor = color3
      , normalBorderColor  = color0
      } `additionalKeys` myKeys
