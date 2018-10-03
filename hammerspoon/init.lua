local laptopScreen = "Color LCD"
local monitorScreen = "LG 32 FHD"

local dualMonitorLayout = {
    {"Spotify",         nil,    laptopScreen, hs.layout.maximized, nil, nil},
    {"Slack",           nil,    laptopScreen, hs.layout.maximized, nil, nil},
    {"Google Chrome",   nil,    monitorScreen, hs.geometry.rect(0.33, 0, 0.66, 1), nil, nil},
    {"Terminal",        nil,    monitorScreen, hs.geometry.rect(0, 0, 0.66, 1), nil, nil},
}



hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.layout.apply(dualMonitorLayout)		   
end)

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
