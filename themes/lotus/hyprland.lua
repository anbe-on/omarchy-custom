-- Theme-specific Hyprland overrides.

local activeBorderColor = "rgb(c84053)"

hl.config({
  general = {
    col = {
      active_border = activeBorderColor,
    },
  },
  group = {
    col = {
      border_active = activeBorderColor,
    },
  },
})

-- Keep terminal opacity crisp on light parchment background
hl.window_rule({ match = { tag = "terminal" }, opacity = "0.98 0.95" })
