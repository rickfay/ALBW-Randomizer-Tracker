--- ALBW Randomizer Tracker Init

--- LUA Scripts
ScriptHost:LoadScript("scripts/control.lua")

--- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/items_tfh.json")
Tracker:AddItems("items/items_chests.json")
Tracker:AddItems("items/items_keys.json")
Tracker:AddItems("items/items_display.json")
Tracker:AddItems("items/items_settings.json")
Tracker:AddItems("items/items_dungeons.json")

--- Maps
Tracker:AddMaps("maps.json")

--- Layouts
Tracker:AddLayouts("layouts/itemgrid.json")
Tracker:AddLayouts("layouts/dungeongrid.json")
Tracker:AddLayouts("layouts/tracker_controls.json")
Tracker:AddLayouts("layouts/capturable.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tracker.json")

--- Locations
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
end
