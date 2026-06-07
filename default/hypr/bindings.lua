-- Deprecated bindings file. New installations include everything directly.

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("$terminal"), { description = "Terminal" })
hl.bind("SUPER + F", hl.dsp.exec_cmd("$fileManager"), { description = "File manager" })
hl.bind("SUPER + D", hl.dsp.exec_cmd("$terminal -e lazydocker"), { description = "Lazy Docker" })

local omarchy = os.getenv("HOME") .. "/.local/share/omarchy"
dofile(omarchy .. "/default/hypr/bindings/media.lua")
dofile(omarchy .. "/default/hypr/bindings/tiling.lua")
dofile(omarchy .. "/default/hypr/bindings/utilities.lua")
