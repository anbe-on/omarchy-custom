-- Menus
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("omarchy-launch-walker"), { description = "Launch apps" })
hl.bind("SUPER + CTRL + E", hl.dsp.exec_cmd("omarchy-launch-walker -m symbols"), { description = "Emoji picker" })
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd("omarchy-menu capture"), { description = "Capture menu" })
hl.bind("SUPER + CTRL + O", hl.dsp.exec_cmd("omarchy-menu toggle"), { description = "Toggle menu" })
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("omarchy-menu-alternative"), { description = "Omarchy menu" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("omarchy-menu system"), { locked = true, description = "Power menu" })
hl.bind("SUPER + K", hl.dsp.exec_cmd("omarchy-menu-keybindings"), { description = "Show key bindings" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"), { description = "Calculator" })

-- Aesthetics
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd("omarchy-toggle-waybar"), { description = "Toggle top bar" })
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd("omarchy-menu background"), { description = "Theme background menu" })
hl.bind("SUPER + SHIFT + CTRL + SPACE", hl.dsp.exec_cmd("omarchy-menu theme"), { description = "Theme menu" })
hl.bind("SUPER + BACKSPACE", function()
  hl.dispatch(hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
end, { description = "Toggle window transparency" })
hl.bind("SUPER + SHIFT + BACKSPACE", hl.dsp.exec_cmd("omarchy-hyprland-window-gaps-toggle"), { description = "Toggle window gaps" })
hl.bind("SUPER + CTRL + BACKSPACE", hl.dsp.exec_cmd("omarchy-hyprland-window-single-square-aspect-toggle"), { description = "Toggle single-window square aspect" })

-- Notifications
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("makoctl dismiss"), { description = "Dismiss last notification" })
hl.bind("SUPER + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"), { description = "Dismiss all notifications" })
hl.bind("SUPER + CTRL + COMMA", hl.dsp.exec_cmd("omarchy-toggle-notification-silencing"), { description = "Toggle silencing notifications" })
hl.bind("SUPER + ALT + COMMA", hl.dsp.exec_cmd("makoctl invoke"), { description = "Invoke last notification" })
hl.bind("SUPER + SHIFT + ALT + COMMA", hl.dsp.exec_cmd("makoctl restore"), { description = "Restore last notification" })

-- Toggles
hl.bind("SUPER + CTRL + I", hl.dsp.exec_cmd("omarchy-toggle-idle"), { description = "Toggle locking on idle" })
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd("omarchy-toggle-nightlight"), { description = "Toggle nightlight" })

-- Control Apple Display brightness
hl.bind("CTRL + F1", hl.dsp.exec_cmd("omarchy-brightness-display-apple -5000"), { description = "Apple Display brightness down" })
hl.bind("CTRL + F2", hl.dsp.exec_cmd("omarchy-brightness-display-apple +5000"), { description = "Apple Display brightness up" })
hl.bind("SHIFT + CTRL + F2", hl.dsp.exec_cmd("omarchy-brightness-display-apple +60000"), { description = "Apple Display full brightness" })

-- Captures
hl.bind("PRINT", hl.dsp.exec_cmd("omarchy-cmd-screenshot"), { description = "Screenshot" })
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("omarchy-menu screenrecord"), { description = "Screenrecording" })
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })

-- File sharing
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("omarchy-menu share"), { description = "Share" })

-- Waybar-less information
hl.bind("SUPER + CTRL + ALT + T", hl.dsp.exec_cmd("notify-send \"   $(date +\"%A %H:%M  --  %d %B W%V %Y\")\""), { description = "Show time" })
hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd("omarchy-battery-status"), { description = "Show battery remaining" })

-- Control panels
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd("omarchy-launch-audio"), { description = "Audio controls" })
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd("omarchy-launch-bluetooth"), { description = "Bluetooth controls" })
hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd("omarchy-launch-wifi"), { description = "Wifi controls" })
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd("omarchy-launch-tui btop"), { description = "Activity" })

-- Dictation
hl.bind("SUPER + CTRL + X", hl.dsp.exec_cmd("voxtype record toggle"), { description = "Toggle dictation" })

-- Zoom
hl.bind("SUPER + CTRL + Z", function()
  local current = hl.getoption("cursor:zoom_factor")
  hl.setkeyword("cursor:zoom_factor", current + 1)
end, { description = "Zoom in" })
hl.bind("SUPER + CTRL + ALT + Z", function()
  hl.setkeyword("cursor:zoom_factor", 1)
end, { description = "Reset zoom" })

-- Lock system
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("omarchy-lock-screen"), { description = "Lock system" })
