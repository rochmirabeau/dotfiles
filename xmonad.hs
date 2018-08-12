import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)

main = xmonad =<< statusBar myBar myPP toggleStrutKey myConfig

myBar = "/home/rochx20w/.cabal/bin/xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "purple" "" . wrap "{" "}" }

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
        where fadeAmount = 0.7

toggleStrutKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig { 
       		modMask = mod4Mask
       	        , manageHook = manageDocks <+> manageHook defaultConfig
            		, layoutHook = smartSpacing 3 $ layoutHook defaultConfig
                , borderWidth = 3
                , logHook = myLogHook
       	}
				`additionalKeys`
								[ ((mod4Mask, xK_r), spawn "rofi -show run -theme Monokai")
                , ((mod4Mask, xK_t), spawn "termite")
                , ((mod4Mask, xK_w), spawn "firefox") 
                ]
        `additionalKeysP`        
                [ ("C-S-<Escape>", spawn "termite -e htop")
                ]
  
