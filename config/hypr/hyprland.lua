hl.monitor({
	output = "",
	mode = "preferred",
	position = "0x0",
	scale = "1",
})

local terminal = "kitty"
local menu = "wofi --show drun --allaw-images"
local browser = "firefox"
local wallpaper = "~/.config/hypr/wallpapers/orange-mountain-church.png"

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img " .. wallpaper .. " --transition-type none")
	hl.exec_cmd("swaync")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("syshud -p top")
	hl.exec_cmd("hyprctl setcursor Adwaita 14")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Adwaita")
	hl.exec_cmd(terminal .. " --class terminalfloatsmall -e ~/.config/scripts/wireguard-master.sh toggle RPI-Home")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "14")
hl.env("HYPRCURSOR_SIZE", "14")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("TERM", terminal)
-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	dwindle = { preserve_split = true },

	general = {
		gaps_in = 6,
		gaps_out = 12,

		border_size = 4,

		col = {
			active_border = "rgb(d65d0e)",
			inactive_border = "rgb(3c3836)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = { enabled = false },

		blur = {
			enabled = true,
			size = 6,
			passes = 3,
			contrast = 2.0,
			vibrancy_darkness = 1.0,
			brightness = 1.3,
			vibrancy = 1,
		},
	},

	animations = {
		enabled = true,
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		font_family = "Mononoki Nerd Font",
		splash_font_family = "Mononoki Nerd Font",
	},
	input = {
		kb_layout = "us,ru,us",
		kb_variant = ",phonetic,intl",
		follow_mouse = 1,
		sensitivity = 0,
		numlock_by_default = true,

		touchpad = {
			natural_scroll = false,
			tap_to_click = false,
			disable_while_typing = false,
		},
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.layer_rule({
	blur = true,
	match = { namespace = "waybar" },
})

hl.layer_rule({
	blur = true,
	match = { namespace = "wofi" },
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
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

hl.window_rule({
	name = "private-sharing",
	no_screen_share = true,
	match = { class = "Bitwarden" },
})

hl.window_rule({
	name = "terminalfloat",
	float = true,
	center = true,
	size = { 1000, 600 },
	match = { class = "terminalfloat" },
})

hl.window_rule({
	name = "terminalfloatsmall",
	float = true,
	center = true,
	size = { 430, 100 },
	match = { class = "terminalfloatsmall" },
})

hl.window_rule({
	name = "waypaper",
	float = true,
	center = true,
	size = { 800, 600 },
	match = { class = "waypaper" },
})

hl.window_rule({
	name = "wiremix",
	float = true,
	center = true,
	size = { 1000, 600 },
	match = { class = "wiremix" },
})

hl.window_rule({
	name = "nwg-look",
	float = true,
	center = true,
	size = { 1000, 600 },
	match = { class = "nwg-look" },
})

hl.window_rule({
	name = "bluetui",
	float = true,
	center = true,
	size = { 1000, 600 },
	match = { class = "bluetui" },
})

hl.window_rule({
	name = "btop",
	float = true,
	center = true,
	size = { 1200, 700 },
	match = { class = "btop" },
})

hl.window_rule({
	name = "nm-connection-editor",
	float = true,
	center = true,
	size = { 1000, 600 },
	match = { class = "nm-connection-editor" },
})

hl.window_rule({
	name = "teletekst",
	float = true,
	center = true,
	size = { 750, 750 },
	match = { class = "teletekst" },
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ "fullscreen", "toggle" }))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("~/.config/waybar/scripts/kbd-hypr.sh next"))

hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/.config/scripts/shutdown-menu.sh"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("~/.config/scripts/actions-menu.sh"))

hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("swaync-client -C"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(terminal .. " --class terminalfloat -e clipse"))

hl.bind("print", hl.dsp.exec_cmd("hyprshot -m region -o ~/Screenshots"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -35, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 35, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -35, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 35, relative = true }), { repeating = true })

for i = 1, 4 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl s 10%- --min-value=1"),
	{ locked = true, repeating = true }
)

-- Locks the screen and suspends, make sure you change `/etc/systemd/logind.conf` to ignore lid
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprlock --grace 0 & systemctl syspend"))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock --grace 0 & systemctl suspend"))

-- Requires playerctl and buttons (which I don't have... Thanks DELL...)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
-- Instead I use these keys:
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
-- For now, no way to detect the keys so just comment the last 3 out if you do have keys.
