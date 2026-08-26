-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- Hyprland 0.53+ syntax
hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

-- Tag all windows for default opacity (apps can override with -default-opacity tag)
hl.window_rule({ match = { class = ".*" }, tag = "+default-opacity" })

-- Fix some dragging issues with XWayland
hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

-- App-specific tweaks (may remove default-opacity tag)
dofile(os.getenv("HOME") .. "/.local/share/omarchy/default/hypr/apps.lua")

-- Apply default opacity after apps have had a chance to opt out
hl.window_rule({ match = { tag = "default-opacity" }, opacity = "0.97 0.9" })
