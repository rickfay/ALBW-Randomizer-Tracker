-- ALBW Randomizer Tracker Init

ScriptHost:LoadScript("scripts/control.lua")

Tracker:AddItems("items.json")
Tracker:AddItems("options.json")
Tracker:AddMaps("maps.json")

Tracker:AddLayouts("layouts/itemgrid.json")
Tracker:AddLayouts("layouts/options_menu.json")
Tracker:AddLayouts("layouts/capturable.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tracker.json")

if Tracker.ActiveVariantUID == "standard" then

    Tracker:AddLocations("locations/hyrule.json")
    Tracker:AddLocations("locations/lorule.json")

    Tracker:AddLocations("locations/maiamai.json")

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
end