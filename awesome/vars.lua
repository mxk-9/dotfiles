local beautiful = require("beautiful")
local gears     = require("gears")

modkey          = "Mod4"
terminal        = "kitty"
editor          = os.getenv("EDITOR") or "emacs"
editor_cmd      = terminal .. " -e " .. editor
home_cfg        = "/home/sny/.config/awesome/"
theme_path      = home_cfg .. "theme/"

LOCKER          = string.format([[
i3lock \
--radius 100 \
--ring-width=10 \
--pass-media-keys \
--keylayout 0 \
--date-str="" --time-str="" \
-F -i %s
]],
	-- (theme_path .. "greenday_fhd.jpg")
	(theme_path .. "spiral_perfecthue_1920x1200.jpg")
)

TOUCHPAD_STATE  = 1
FONT            = "JetBrains Mono 14"

-- Themes define colours, icons, font and wallpapers.
beautiful.init(theme_path .. "theme.lua")
