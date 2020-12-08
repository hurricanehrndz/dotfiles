  -- darcs starter config
import System.IO
import XMonad
  -- Support modern browsers, panels and trays
  -- Toggle panel visibility (mod+b)
import XMonad.Config.Desktop

  -- Hooks
import XMonad.Hooks.DynamicLog

  -- Utilities
import XMonad.Util.Run(spawnPipe)
--import XMonad.Util.EZConfig(additionalKeys)

-- my config
baseConfig = desktopConfig {
  modMask = mod4Mask,         -- Use Super instead of Alt
  terminal = "alacritty"
  }

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar $HOME/.config/xmobar/xmobarrc"
  xmonad $ baseConfig {
    logHook = logHook baseConfig <+> dynamicLogWithPP xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle = xmobarColor "green" "" . shorten 40 . xmobarStrip
      }
    }
