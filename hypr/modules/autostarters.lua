hl.on("hyprland.start", function()
	hl.exec_cmd("gammastep")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	hl.exec_cmd("[workspace 1 silent] " .. _G.browser)
	hl.exec_cmd("[workspace 2 silent] " .. _G.terminal)
	hl.exec_cmd("[workspace 3 silent] " .. _G.browser)
end)
