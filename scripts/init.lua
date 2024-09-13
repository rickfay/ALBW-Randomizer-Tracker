--- ALBW Randomizer Tracker Init

--- LUA Scripts
ScriptHost:LoadScript("scripts/control.lua")
ScriptHost:LoadScript("scripts/access_death_mountain.lua")
ScriptHost:LoadScript("scripts/access_hyrule.lua")
ScriptHost:LoadScript("scripts/access_lorule.lua")

--- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/items_tfh.json")
Tracker:AddItems("items/items_chests.json")
Tracker:AddItems("items/items_keys.json")
Tracker:AddItems("items/items_maps.json")
Tracker:AddItems("items/items_display.json")
Tracker:AddItems("items/items_dungeons.json")
Tracker:AddItems("items/items_labels.json")
Tracker:AddItems("items/items_cracks.json")
--Tracker:AddItems("items/items_prizes.json")
Tracker:AddItems("items/items_settings.json")
Tracker:AddItems("items/items_weather_vanes.json")

--- Maps
Tracker:AddMaps("maps.json")

--- Layouts
Tracker:AddLayouts("layouts/item_grid.json")
Tracker:AddLayouts("layouts/tracker_settings.json")
Tracker:AddLayouts("layouts/capturable.json")
Tracker:AddLayouts("layouts/event_grid.json")
Tracker:AddLayouts("layouts/key_grid.json")
Tracker:AddLayouts("layouts/label_grid.json")
Tracker:AddLayouts("layouts/dungeon_grid.json")
Tracker:AddLayouts("layouts/weather_vane_grid.json")

Tracker:AddLayouts("layouts/maps/worlds.json")
Tracker:AddLayouts("layouts/maps/eastern.json")
Tracker:AddLayouts("layouts/maps/gales.json")
Tracker:AddLayouts("layouts/maps/hera.json")
Tracker:AddLayouts("layouts/maps/hyrule_castle.json")
Tracker:AddLayouts("layouts/maps/dark.json")
Tracker:AddLayouts("layouts/maps/swamp.json")
Tracker:AddLayouts("layouts/maps/skull.json")
Tracker:AddLayouts("layouts/maps/thieves.json")
Tracker:AddLayouts("layouts/maps/turtle.json")
Tracker:AddLayouts("layouts/maps/desert.json")
Tracker:AddLayouts("layouts/maps/ice.json")
Tracker:AddLayouts("layouts/maps/lorule_castle.json")

Tracker:AddLayouts("layouts/maps.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tracker.json")

--- Locations
if Tracker.ActiveVariantUID == "standard" then
    Tracker:AddLocations("locations/hyrule.json")
    Tracker:AddLocations("locations/lorule.json")
    Tracker:AddLocations("locations/death_mountain.json")

    Tracker:AddLocations("locations/dungeons/eastern.json")
    Tracker:AddLocations("locations/dungeons/gales.json")
    Tracker:AddLocations("locations/dungeons/hera.json")
    Tracker:AddLocations("locations/dungeons/hyrule_castle.json")

    Tracker:AddLocations("locations/dungeons/dark.json")
    Tracker:AddLocations("locations/dungeons/swamp.json")
    Tracker:AddLocations("locations/dungeons/skull.json")
    Tracker:AddLocations("locations/dungeons/thieves.json")
    Tracker:AddLocations("locations/dungeons/turtle.json")
    Tracker:AddLocations("locations/dungeons/desert.json")
    Tracker:AddLocations("locations/dungeons/ice.json")
    Tracker:AddLocations("locations/dungeons/lorule_castle.json")

    Tracker:AddLocations("locations/weather_vanes.json")
    Tracker:AddLocations("locations/cracks_hyrule.json")
    Tracker:AddLocations("locations/cracks_lorule.json")
    Tracker:AddLocations("locations/maiamai.json")
end
