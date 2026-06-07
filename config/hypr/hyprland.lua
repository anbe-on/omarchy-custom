-- Learn how to configure Hyprland: https://wiki.hyprland.org/Configuring/

hl.on("hyprland.start", function()
  hl.exec_cmd("hyprlock --immediate-render --no-fade-in")
end)

-- Use defaults Omarchy defaults (but don't edit these directly!)
require("default/hypr/autostart")
require("default/hypr/bindings/media")
require("default/hypr/bindings/clipboard")
require("default/hypr/bindings/tiling-v2")
require("default/hypr/bindings/utilities")
require("default/hypr/envs")
require("default/hypr/looknfeel")
require("default/hypr/input")
require("default/hypr/windows")
require(os.getenv("HOME") .. "/.config/omarchy/current/theme/hyprland")

-- Change your own setup in these files (and overwrite any settings from defaults!)
require("monitors")
require("input")
require("bindings")
require("looknfeel")
require("autostart")

-- Add any other personal Hyprland configuration below
-- hl.window_rule({ name = "workspace-5-qemu", match = { class = "qemu" }, workspace = "5" })
