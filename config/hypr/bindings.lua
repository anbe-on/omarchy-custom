-- Application bindings
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec --dir=\"$(omarchy-cmd-terminal-cwd)\""), { description = "Terminal" })
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec --dir=\"$(omarchy-cmd-terminal-cwd)\" bash -c \"tmux attach || tmux new -s Work\""), { description = "Tmux" })
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("omarchy-launch-browser"), { description = "Browser" })
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"), { description = "File manager" })
hl.bind("SUPER + ALT + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window \"$(omarchy-cmd-terminal-cwd)\""), { description = "File manager (cwd)" })
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("omarchy-launch-browser"), { description = "Browser" })
hl.bind("SUPER + SHIFT + ALT + B", hl.dsp.exec_cmd("omarchy-launch-browser --private"), { description = "Browser (private)" })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("omarchy-launch-tui lazydocker"), { description = "Docker" })

-- If your web app url contains #, type it as ## to prevent hyprland treating it as a comment

-- Add extra bindings
-- hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("alacritty -e ssh your-server"))

-- Overwrite existing bindings, like putting Omarchy Menu on Super + Space
-- hl.bind("SUPER", "SPACE", hl.dsp.exec_cmd("omarchy-menu"), { description = "Omarchy menu" })

-- Unbind screenshot and change int to super shift s
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("omarchy-cmd-screenshot"), { description = "Screenshot of region" })

-- Change input language
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("fcitx5-remote -t"))

-- Use ALT (Mod1) + Left Click to resize
hl.bind("ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Four finger gesture to change workspaces
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
