-- Deprecated bindings file. New installations include everything directly.

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("$terminal"), { description = "Terminal" })
hl.bind("SUPER + F", hl.dsp.exec_cmd("$fileManager"), { description = "File manager" })
hl.bind("SUPER + D", hl.dsp.exec_cmd("$terminal -e lazydocker"), { description = "Lazy Docker" })

require("default/hypr/bindings/media")
require("default/hypr/bindings/tiling")
require("default/hypr/bindings/utilities")
