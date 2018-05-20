import           Data.Default                     (def)
import           Graphics.X11.ExtraTypes.XF86
import           System.IO
import           XMonad

-- Actions
import           XMonad.Actions.CopyWindow        (copy)
import           XMonad.Actions.DynamicWorkspaces
import           XMonad.Actions.UpdatePointer     (updatePointer)
import           XMonad.Hooks.DynamicLog          (xmobar)
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks

-- Layouts
import           XMonad.Layout.Fullscreen         (fullscreenFull)
import           XMonad.Layout.Grid
import           XMonad.Layout.NoBorders          (noBorders, smartBorders)
import           XMonad.Layout.NoFrillsDecoration hiding (urgentColor)
import           XMonad.Layout.PerWorkspace       (onWorkspace)
import           XMonad.Layout.Reflect
import           XMonad.Layout.ResizableTile
import           XMonad.Layout.SimpleDecoration   hiding (urgentColor)
import           XMonad.Layout.Spacing            (smartSpacing)
import           XMonad.Layout.Spacing
import           XMonad.Layout.ToggleLayouts

import           XMonad.ManageHook                (composeAll, doShift,
                                                   resource, (-->), (=?))
import           XMonad.Prompt
import qualified XMonad.StackSet                  as W
import           XMonad.Util.EZConfig             (additionalKeys)
import           XMonad.Util.Run                  (spawnPipe)

-- ------------------------
-- Xmonad entry point
-- ------------------------

main = do
    xmproc <- spawnPipe myStatusBar
    xmonad $ myConfig xmproc

myConfig p =  def
      { manageHook         = myManageHook
      , layoutHook         = myLayoutHook
      , logHook            = myLogHook p
      , modMask            = mod4Mask
      , terminal           = myTerm
      , workspaces         = myWorkspaces
      , borderWidth        = myBorderWidth
      , focusedBorderColor = blue
      , normalBorderColor  = color0
      , startupHook        = myStartupHook
      , handleEventHook    = myHandleEventHook
      } `additionalKeys` myKeys

------------------------------------------------------------------------
-- Workspaces
------------------------------------------------------------------------

wsDev      = "dev"
wsTerm     = "term"
wsWeb      = "web"
wsEmail    = "email"
wsFiles    = "files"
wsMusic    = "music"
wsDownload = "download"

myWorkspaces :: [String]
myWorkspaces = [wsDev, wsTerm, wsWeb, wsEmail, wsFiles, wsMusic, wsDownload]

-- myWorkspaces = map show [1..9]
-- myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
-- myWorkspaces = [wsGEN, wsDEV, wsWRK, wsMUS]

-- ------------------------
-- Config
-- ------------------------

myTerm        = "urxvt"
myStatusBar   = "xmobar"
myFileManager = "nautilus"
myBrowser     = "firefox"
myDevBrowser  = "chromium-browser"
myMusic       = "spotify"
xmonadPath    = "/home/chouffe/.xmonad/"
scriptsPath   = xmonadPath ++ "scripts/"
configPath    = xmonadPath ++ "config/"

-- ------------------------
-- Layouts
-- ------------------------

myLayoutHook = smartBorders
  $ toggleLayouts fullScreenLayout      -- Fullscreen mode with mod-z
  $ avoidStruts
  $ standardLayout                      -- Master area with golden ratio
    -- ||| reflectHoriz standardLayout     -- Horizontal reflection of the standardLayout
    ||| spacedTiledLayout               -- spaced between master tiles and same as standardLayout
    ||| Grid                            -- Grid Layout
    ||| smartSpacing gapSize Grid     -- Grid Layout with spaces

  where
    nmaster = 1
    delta   = 3 / 100
    ratio   = toRational (2 / (1 + sqrt 5 :: Double)) -- Default proportion of the screen taken up by main pane (Golden Ratio)
    gapSize = 5

    -- My Layouts
    standardLayout    = ResizableTall nmaster delta ratio []
    spacedTiledLayout = smartSpacing gapSize $ standardLayout
    fullScreenLayout  = noBorders $ fullscreenFull Full


-- TODO: add spacing layout

-- myLayout = defaultWorkspace
--   -- workSpace0 $ workSpace1 $ defaultWorkspace
--   where
--      -- Default tiling algorithm partitions the screen into two panes
--      tiled          = smartSpacing 5 $ ResizableTall nmaster delta ratio []
--      tiledSpace     = smartSpacing 60 $ ResizableTall nmaster delta ratio []
--      fullScreen     = noBorders $ fullscreenFull Full
--      fullTile       = ResizableTall nmaster delta ratio []
--      borderlessTile = noBorders fullTile
--      nmaster        = 1 -- The default number of windows in the master pane
--      ratio          = toRational (2 / (1 + sqrt 5 :: Double)) -- Default proportion of the screen taken up by main pane (Goldern Ratio)
--      delta          = 3 / 100 -- Percent of screen to increment by when resizing panes

--      -- addTopBar      = noFrillsDeco shrinkText topBarTheme
--      -- mySpacing      = smartSpacing gapSize

--      -- Workspace layouts
--      -- workSpace0       = onWorkspace (myWorkspaces !! 0) $
--      --   toggleLayouts fullScreen $
--      --     avoidStruts (tiled ||| Mirror tiled ||| tiledSpace) ||| avoidStruts fullTile

--      -- workSpace1       = onWorkspace (myWorkspaces !! 1) $
--      --   toggleLayouts fullScreen $
--      --     avoidStruts (fullTile ||| tiledSpace) ||| fullScreen

--      defaultWorkspace = smartBorders  -- Removes borders if only one window
--        $ toggleLayouts fullScreen     -- Fullscreen mode with mod-z
--        $ avoidStruts                  -- Makes xmobar appear
--        -- $ addTopBar
--        $ fullTile ||| tiled ||| tiledSpace

-- ---------------
-- LogHook
-- ---------------

myLogHook h =
  dynamicLogWithPP xmobarPP
    { ppOutput          = hPutStrLn h
    , ppCurrent         = xmobarColor color15 background     . pad . wrap "[" "]"
    , ppVisible         = xmobarColor color14 background     . pad . wrap "(" ")"
    , ppHidden          = xmobarColor color14 background     . pad
    , ppHiddenNoWindows = const ""  -- Hides workspaces with no windows
    , ppTitle           = xmobarColor color10 background     . shorten 40 . pad
    , ppLayout          = xmobarColor color1 background      . pad . myLayoutPrinter
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

myManageHook =
  composeAll [
               resource =? "dmenu" --> doFloat
             , resource =? myMusic --> doShift wsMusic
             , resource =? "nautilus" --> doShift wsFiles
             , resource =? "transmission" --> doShift wsDownload
             , resource =? "transmission-gtk" --> doShift wsDownload
             , className =? "stalonetray" --> doIgnore
             ]
    <+> manageDocks
    <+> manageHook def

-- ------------------------------------------------
-- External Commands
-- ------------------------------------------------

dmenuArgs :: String -> [String]
dmenuArgs title = [ "-i"
                  , "-nb", quote background
                  , "-nf", quote color2
                  , "-sb", quote color1
                  , "-sf", quote foreground
                  , "-fn", quote myFont
                  , "-p",  quote title
                  ]
  where quote s = "'" ++ s ++ "'"

dmenuRunCmd :: String
dmenuRunCmd = "dmenu_run " ++ (unwords $ dmenuArgs "Run Program:")

passmenuRunCmd :: String
passmenuRunCmd = scriptsPath ++ "passmenu " ++ (unwords $ dmenuArgs "Password:")

clipmenuRunCmd :: String
clipmenuRunCmd = scriptsPath ++ "clipmenu " ++ (unwords $ dmenuArgs "Clipboard:")

musicPlayerCmd :: String -> String
musicPlayerCmd cmd = scriptsPath ++ "shpotify " ++ cmd

screenshotFolder :: String
screenshotFolder = "~/Pictures/"

----------------------------------------
-- Keyboard Options
----------------------------------------
myKeys =
  [ -- Dynamic Workspaces
    -- ((mod4Mask .|. shiftMask, xK_v), selectWorkspace myPromptTheme)
    ((mod4Mask, xK_v),               selectWorkspace myPromptTheme)
  , ((mod4Mask .|. shiftMask, xK_v), withWorkspace myPromptTheme (windows . W.shift))
  -- , ((mod4Mask, xK_m),              withWorkspace myPromptTheme (windows . W.shift))
  -- , ((mod4Mask .|. shiftMask, xK_m      ), withWorkspace myPromptTheme (windows . copy))
  -- ((mod4Mask .|. shiftMask, xK_BackSpace), removeWorkspace)
  -- , ((mod4Mask .|. shiftMask, xK_r),   renameWorkspace def)

  -- Screensaver
  , ((mod4Mask, xK_Escape), spawn "gnome-screensaver-command -l")

  -- Dmenu
  , ((mod4Mask, xK_p), spawn dmenuRunCmd)

  -- PassMenu
  -- TODO: add a preview mode as well
  , ((mod4Mask .|. shiftMask, xK_p), spawn passmenuRunCmd)

  -- Clipmenu
  , ((mod4Mask, xK_y), spawn clipmenuRunCmd)

  -- Gmrun: Default binding
  -- , ((mod4Mask, xK_P), spawn "gmrun")

  -- Media
  , ((0, xF86XK_AudioPrev),  spawn $ musicPlayerCmd "prev")
  , ((0, xF86XK_AudioNext),  spawn $ musicPlayerCmd "next")
  , ((0, xF86XK_AudioPlay),  spawn $ musicPlayerCmd "play")
  , ((0, xF86XK_AudioPause), spawn $ musicPlayerCmd "pause")

  -- Music
  -- , ((mod4Mask .|. shiftMask, xK_m), spawn myMusic)

  -- Terminal: Default KeyBinding
  -- , ((mod4Mask .|. shiftMask, xK_Return), spawn myTerm)

  -- Files
  , ((mod4Mask, xK_f), spawn myFileManager)

  -- Browser
  , ((mod4Mask, xK_b),               spawn myBrowser)
  , ((mod4Mask .|. shiftMask, xK_b), spawn myDevBrowser)

  -- Layout toggle
  , ((mod4Mask .|. controlMask, xK_space), sendMessage ToggleLayout)
  -- , ((mod4Mask, xK_space),                 sendMessage ToggleLayout)
  , ((mod4Mask, xK_z),                     sendMessage (Toggle "Full"))

  -- Refresh
  , ((mod4Mask, xK_n), refresh)

  -- Screenshots
  -- gnome-screenshot
  , ((mod4Mask .|. shiftMask, xK_Insert), spawn $ "gnome-screenshot -a")  -- area to grab: does not work for some reason
  , ((mod4Mask, xK_Insert),               spawn $ "gnome-screenshot -d 1")  -- full window
  , ((0, xK_Print),                       spawn $ "gnome-screenshot -i")  -- interactive mode

  -- Backlight
  , ((0, xF86XK_MonBrightnessUp),   spawn "xbacklight -inc 10")
  , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")

  -- Sound
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 5%-")
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 5%+")
  , ((0, xF86XK_AudioMute),        spawn "amixer -D pulse sset Master toggle")
  ]

-- ------------------------
-- Startup
-- ------------------------

myStartupHook = do
  spawn $ scriptsPath ++ "clipmenud"       -- Starts clipmenud for clipboard management via dmenu
  spawn $ scriptsPath ++ "init-wallpaper"  -- Sets wallpaper
  spawn "redshift"                         -- Starts redshift: blue light filter
  -- spawn $ "stalonetray -c " ++ configPath ++ ".stalonetrayrc"
  -- spawn $ "nm-applet"
  return ()

-- ------------------------
-- HandleEventHook
-- ------------------------

-- It makes xmobar to be visible
-- this must be in this order, docksEventHook must be last
myHandleEventHook = handleEventHook defaultConfig <+> docksEventHook

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

myFont       = "xft:Inconsolata:size=13:antialias=true"
myMediumFont = "xft:Inconsolata:size=14:antialias=true"
myLargeFont  = "xft:Inconsolata:size=24:antialias=true"

yellow  = "#b58900"
orange  = "#cb4b16"
red     = "#dc322f"
magenta = "#d33682"
violet  = "#6c71c4"
blue    = "#268bd2"
cyan    = "#2aa198"
green   = "#859900"

active       = blue
activeWarn   = red
inactive     = color2
focusColor   = blue
unfocusColor = color2

-- Sizes
topBarSize = 10
gapSize    = 3
borderSize = 2
promptSize = 25
statusSize = 20

-- Border
myBorderWidth = 2

-- This is a "fake title" used as a highlight bar in lieu of full borders
-- topBarTheme = def
--     { fontName              = myFont
--     , inactiveBorderColor   = color10
--     , inactiveColor         = color10
--     , inactiveTextColor     = color10
--     , activeBorderColor     = active
--     , activeColor           = active
--     , activeTextColor       = active
--     , urgentBorderColor     = red
--     , urgentTextColor       = yellow
--     , decoHeight            = topBarSize
-- }

myPromptTheme = def
  { font                  = myMediumFont
  , alwaysHighlight       = True
  , bgColor               = background
  , fgColor               = color15
  , fgHLight              = color14
  , bgHLight              = background
  , borderColor           = color5
  , promptBorderWidth     = 0
  , height                = promptSize
  , position              = Top
  }

-- Xmobar Specific
lowColor    = color2
normalColor = color15
highColor   = color10
