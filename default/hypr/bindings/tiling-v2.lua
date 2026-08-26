-- Close windows
hl.bind("SUPER + W", hl.dsp.window.close(), { description = "Close window" })
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("omarchy-hyprland-window-close-all"), { description = "Close all windows" })

-- Control tiling
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { description = "Pseudo window" })
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window floating/tiling" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Full screen" })
hl.bind("SUPER + O", hl.dsp.exec_cmd("omarchy-hyprland-window-pop"), { description = "Pop window out (float & pin)" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("omarchy-hyprland-workspace-layout-toggle"), { description = "Toggle workspace layout" })

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }), { description = "Move window focus left" })
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }), { description = "Move window focus right" })
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }), { description = "Move window focus up" })
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }), { description = "Move window focus down" })

-- Switch workspaces with SUPER + [1-9; 0]
hl.bind("SUPER + code:10", hl.dsp.focus({ workspace = 1 }), { description = "Switch to workspace 1" })
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = 2 }), { description = "Switch to workspace 2" })
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = 3 }), { description = "Switch to workspace 3" })
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = 4 }), { description = "Switch to workspace 4" })
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = 5 }), { description = "Switch to workspace 5" })
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = 6 }), { description = "Switch to workspace 6" })
hl.bind("SUPER + code:16", hl.dsp.focus({ workspace = 7 }), { description = "Switch to workspace 7" })
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = 8 }), { description = "Switch to workspace 8" })
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = 9 }), { description = "Switch to workspace 9" })
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = 10 }), { description = "Switch to workspace 10" })

-- Move active window to a workspace with SUPER + SHIFT + [1-9; 0]
hl.bind("SUPER + SHIFT + code:10", hl.dsp.window.move({ workspace = 1 }), { description = "Move window to workspace 1" })
hl.bind("SUPER + SHIFT + code:11", hl.dsp.window.move({ workspace = 2 }), { description = "Move window to workspace 2" })
hl.bind("SUPER + SHIFT + code:12", hl.dsp.window.move({ workspace = 3 }), { description = "Move window to workspace 3" })
hl.bind("SUPER + SHIFT + code:13", hl.dsp.window.move({ workspace = 4 }), { description = "Move window to workspace 4" })
hl.bind("SUPER + SHIFT + code:14", hl.dsp.window.move({ workspace = 5 }), { description = "Move window to workspace 5" })
hl.bind("SUPER + SHIFT + code:15", hl.dsp.window.move({ workspace = 6 }), { description = "Move window to workspace 6" })
hl.bind("SUPER + SHIFT + code:16", hl.dsp.window.move({ workspace = 7 }), { description = "Move window to workspace 7" })
hl.bind("SUPER + SHIFT + code:17", hl.dsp.window.move({ workspace = 8 }), { description = "Move window to workspace 8" })
hl.bind("SUPER + SHIFT + code:18", hl.dsp.window.move({ workspace = 9 }), { description = "Move window to workspace 9" })
hl.bind("SUPER + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }), { description = "Move window to workspace 10" })

-- Move active window silently to a workspace with SUPER + SHIFT + ALT + [1-9; 0]
hl.bind("SUPER + SHIFT + ALT + code:10", hl.dsp.window.move({ workspace = 1, silent = true }), { description = "Move window silently to workspace 1" })
hl.bind("SUPER + SHIFT + ALT + code:11", hl.dsp.window.move({ workspace = 2, silent = true }), { description = "Move window silently to workspace 2" })
hl.bind("SUPER + SHIFT + ALT + code:12", hl.dsp.window.move({ workspace = 3, silent = true }), { description = "Move window silently to workspace 3" })
hl.bind("SUPER + SHIFT + ALT + code:13", hl.dsp.window.move({ workspace = 4, silent = true }), { description = "Move window silently to workspace 4" })
hl.bind("SUPER + SHIFT + ALT + code:14", hl.dsp.window.move({ workspace = 5, silent = true }), { description = "Move window silently to workspace 5" })
hl.bind("SUPER + SHIFT + ALT + code:15", hl.dsp.window.move({ workspace = 6, silent = true }), { description = "Move window silently to workspace 6" })
hl.bind("SUPER + SHIFT + ALT + code:16", hl.dsp.window.move({ workspace = 7, silent = true }), { description = "Move window silently to workspace 7" })
hl.bind("SUPER + SHIFT + ALT + code:17", hl.dsp.window.move({ workspace = 8, silent = true }), { description = "Move window silently to workspace 8" })
hl.bind("SUPER + SHIFT + ALT + code:18", hl.dsp.window.move({ workspace = 9, silent = true }), { description = "Move window silently to workspace 9" })
hl.bind("SUPER + SHIFT + ALT + code:19", hl.dsp.window.move({ workspace = 10, silent = true }), { description = "Move window silently to workspace 10" })

-- Control scratchpad
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", silent = true }), { description = "Move window to scratchpad" })

-- TAB between workspaces
hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind("SUPER + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }), { description = "Former workspace" })

-- Move workspaces to other monitors
--hl.bind("SUPER + SHIFT + ALT + LEFT", hl.dsp.workspace.move_current_to({ direction = "left" }), { description = "Move workspace to left monitor" })
--hl.bind("SUPER + SHIFT + ALT + RIGHT", hl.dsp.workspace.move_current_to({ direction = "right" }), { description = "Move workspace to right monitor" })
--hl.bind("SUPER + SHIFT + ALT + UP", hl.dsp.workspace.move_current_to({ direction = "up" }), { description = "Move workspace to up monitor" })
--hl.bind("SUPER + SHIFT + ALT + DOWN", hl.dsp.workspace.move_current_to({ direction = "down" }), { description = "Move workspace to down monitor" })

-- Swap active window with the one next to it with SUPER + SHIFT + arrow keys
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }), { description = "Swap window to the left" })
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }), { description = "Swap window to the right" })
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "up" }), { description = "Swap window up" })
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "down" }), { description = "Swap window down" })

-- Cycle through applications on active workspace
hl.bind("ALT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "Cycle to next window" })
hl.bind("ALT + SHIFT + TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ prev = true }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "Cycle to previous window" })

-- Resize active window
local function resize_active(dx, dy)
  local w = hl.get_active_window()
  if w == nil then return end

  -- size may come back as an indexed table {width, height} or a named
  -- one {x=..., y=...} depending on build; handle both.
  local cur_w = w.size[1] or w.size.x
  local cur_h = w.size[2] or w.size.y

  local new_w = math.max(20, cur_w + dx)
  local new_h = math.max(20, cur_h + dy)

  hl.dispatch(hl.dsp.window.resize({ x = new_w, y = new_h, relative = false }))
end

-- Resize active window
hl.bind("SUPER + code:20", function() resize_active(-100, 0) end, { description = "Expand window left", repeating = true })
hl.bind("SUPER + code:21", function() resize_active(100, 0) end, { description = "Shrink window left", repeating = true })
hl.bind("SUPER + SHIFT + code:20", function() resize_active(0, -100) end, { description = "Shrink window up", repeating = true })
hl.bind("SUPER + SHIFT + code:21", function() resize_active(0, 100) end, { description = "Expand window down", repeating = true })

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Cycle monitor refresh rate
hl.bind("SUPER + Backslash", hl.dsp.exec_cmd("omarchy-switch-refresh-rate"), { description = "Cycle monitor refresh rate" })
