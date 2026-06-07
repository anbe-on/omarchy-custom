-- Learn how to configure Hyprland: https://wiki.hyprland.org/Configuring/

local home = os.getenv("HOME")
local omarchy = home .. "/.local/share/omarchy"

hl.on("hyprland.start", function()
  hl.exec_cmd("hyprlock --immediate-render --no-fade-in")
end)

-- Use defaults Omarchy defaults (but don't edit these directly!)
dofile(omarchy .. "/default/hypr/autostart.lua")
dofile(omarchy .. "/default/hypr/bindings/media.lua")
dofile(omarchy .. "/default/hypr/bindings/clipboard.lua")
dofile(omarchy .. "/default/hypr/bindings/tiling-v2.lua")
dofile(omarchy .. "/default/hypr/bindings/utilities.lua")
dofile(omarchy .. "/default/hypr/envs.lua")
dofile(omarchy .. "/default/hypr/looknfeel.lua")
dofile(omarchy .. "/default/hypr/input.lua")
dofile(omarchy .. "/default/hypr/windows.lua")
dofile(home .. "/.config/omarchy/current/theme/hyprland.lua")

-- Change your own setup in these files (and overwrite any settings from defaults!)
require("monitors")
require("input")
require("bindings")
require("looknfeel")
require("autostart")

-- Add any other personal Hyprland configuration below
-- hl.window_rule({ name = "workspace-5-qemu", match = { class = "qemu" }, workspace = "5" })
