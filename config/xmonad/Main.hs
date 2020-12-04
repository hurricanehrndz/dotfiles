-- vim: set sw=4 et:
  -- Base
import XMonad
import System.IO

  -- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

  -- Utilities
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks defaults

-- my config
defaults = def {
        modMask = mod4Mask,         -- Use Super instead of Alt
        terminal = "alacritty",
        layoutHook = avoidStruts $ layoutHook def
    }
