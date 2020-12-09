-- darcs starter config
import System.IO
import XMonad

-- Actions
-- import XMonad.Actions.CycleWS(nextScreen, prevScreen)

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

-- Utilities
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP, removeKeysP)
import XMonad.Util.Cursor
import XMonad.Util.SpawnOnce

-- Layouts
import XMonad.Layout.ResizableTile
import XMonad.Layout.MultiToggle (mkToggle, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

-- Gaps
mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- layouts
myLayoutHook = avoidStruts . smartBorders .
  mkToggle (NBFULL ?? NOBORDERS ?? EOT) $
  tiled
  ||| Mirror tiled
  ||| noBorders Full
  where
    tiled = renamed [Replace "tall"] $ mySpacing 4 $ ResizableTall nmaster delta ratio []
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 60/100
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100


-- startup
myStartupHook = do
   setDefaultCursor xC_left_ptr
   spawnOnce "nitrogen --restore &"

-- remove default binds
noDefaultKeys :: [String]
noDefaultKeys =
  [
    "M-<Space>",
    "M-S-p"
  ]

-- my keyboard shortcuts
myKeys :: [(String, X ())]
myKeys =
  [
    -- Layout
    ("M-<Space> b"        , sendMessage ToggleStruts)                                   ,
    ("M-<Space> n"        , sendMessage NextLayout)                                     ,
    ("M-<Space> <Return>" , sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) ,

    -- Toggle dock
    ("M-b"   , sendMessage ToggleStruts)   ,

    -- Increase/decrease spacing (gaps)
    ("M-d"   , decWindowSpacing 4)         , -- Decrease window spacing
    ("M-i"   , incWindowSpacing 4)         , -- Increase window spacing
    ("M-S-d" , decScreenSpacing 4)         , -- Decrease screen spacing
    ("M-S-i" , incScreenSpacing 4)           -- Increase screen spacing
  ]


main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar $HOME/.config/xmobar/xmobarrc"
  xmonad $ ewmh $ docks def {
    modMask = mod4Mask,         -- Use Super instead of Alt
    terminal = "alacritty",
    layoutHook = myLayoutHook,
    logHook = dynamicLogWithPP xmobarPP {
      ppOutput = hPutStrLn xmproc                         ,
      ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]" , -- Current workspace in xmobar
      ppVisible = xmobarColor "#98be65" ""                , -- Visible but not current workspace
      ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""   , -- Hidden workspaces in xmobar
      ppHiddenNoWindows = xmobarColor "#c792ea" ""        , -- Hidden workspaces (no windows)
      ppSep =  "<fc=#666666> <fn=2>|</fn> </fc>"          , -- Separators in xmobar
      ppTitle = xmobarColor "#b3afc2" "" . shorten 40 . xmobarStrip
      }
    } `removeKeysP` noDefaultKeys  `additionalKeysP` myKeys
