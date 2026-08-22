-- Change the default Omarchy look'n'feel

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({
  general = {
    -- No gaps between windows or borders
    gaps_in = 1,
    gaps_out = 1,
    border_size = 0,

    -- Use master layout instead of dwindle
    -- layout = "master",
  },
})

-- https://wiki.hyprland.org/Configuring/Variables/#decoration
hl.config({
  decoration = {
    -- Use round window corners
    rounding = 2,

    active_opacity = 1.0,
    inactive_opacity = 0.88,
    -- dim_inactive = true,
    -- dim_strength = 0.1,
  },
})

-- https://wiki.hyprland.org/Configuring/Variables/#animations
hl.config({
  animations = {
    -- Disable all animations
    -- enabled = false,
  },
})

-- https://wiki.hypr.land/Configuring/Variables/#layout
hl.config({
  layout = {
    -- Avoid overly wide single-window layouts on wide screens
    -- single_window_aspect_ratio = "1 1",
  },
})

-- Monitor and Environment scaling rules
hl.raw([[
env = GDK_SCALE,1.5
monitor=,preferred,auto,1.5
]])
