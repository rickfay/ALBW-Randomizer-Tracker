-- ALBW Randomizer Tracker Init

ScriptHost:LoadScript("scripts/control.lua")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/items_chests.json")
Tracker:AddItems("items/items_dungeons.json")
--Tracker:AddItems("items/items_dungeons_full.json")
--Tracker:AddItems("items/items_weather_vanes.json")

Tracker:AddItems("options.json")
Tracker:AddMaps("maps.json")

Tracker:AddLayouts("layouts/itemgrid.json")
Tracker:AddLayouts("layouts/tracker_settings.json")
--Tracker:AddLayouts("layouts/options_menu.json")
Tracker:AddLayouts("layouts/capturable.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tracker.json")

if Tracker.ActiveVariantUID == "standard" then

    Tracker:AddLocations("locations/hyrule.json")
    Tracker:AddLocations("locations/lorule.json")

    Tracker:AddLocations("locations/dungeons/eastern.json")
    Tracker:AddLocations("locations/dungeons/gales.json")
    Tracker:AddLocations("locations/dungeons/hera.json")
    Tracker:AddLocations("locations/dungeons/hyruleCastle.json")
    Tracker:AddLocations("locations/dungeons/dark.json")
    Tracker:AddLocations("locations/dungeons/swamp.json")
    Tracker:AddLocations("locations/dungeons/skull.json")
    Tracker:AddLocations("locations/dungeons/thieves.json")
    Tracker:AddLocations("locations/dungeons/turtle.json")
    Tracker:AddLocations("locations/dungeons/desert.json")
    Tracker:AddLocations("locations/dungeons/ice.json")
    Tracker:AddLocations("locations/dungeons/loruleCastle.json")

    Tracker:AddLocations("locations/maiamai.json")
--    Tracker:AddLocations("locations/weather_vanes.json")
end

--ScriptHost:LoadScript("scripts/badges.lua")