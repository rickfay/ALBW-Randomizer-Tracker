HyruleWeatherVanes = {
    "@Weather Vane 01/Your House",
    "@Weather Vane 02/Kakariko Village",
    "@Weather Vane 03/Eastern Palace",
    "@Weather Vane 04/House of Gales",
    "@Weather Vane 05/Tower of Hera",
    "@Weather Vane 06/Witch's House",
    "@Weather Vane 07/Death Mountain (Hyrule)",
    "@Weather Vane 08/Desert Palace",
    "@Weather Vane 09/Sanctuary"
}
LoruleWeatherVanes = {
    "@Weather Vane 10/Skull Woods",
    "@Weather Vane 11/Treacherous Tower",
    "@Weather Vane 12/Ice Ruins",
    "@Weather Vane 13/Lorule Castle",
    "@Weather Vane 14/Graveyard",
    "@Weather Vane 15/Thieves' Town",
    "@Weather Vane 16/Dark Palace",
    "@Weather Vane 17/Blacksmith",
    "@Weather Vane 18/Vacant House",
    "@Weather Vane 19/Misery Mire",
    "@Weather Vane 20/Swamp Palace",
    "@Weather Vane 21/Turtle Rock",
    "@Weather Vane 22/Death Mountain (Lorule)"
}

-- Adds static badge to location
-- Badge references are not cached as these badges are intended to be permanent location labels
function add_static_badges(badge, locations)

    for _, section in pairs(locations) do

        local target = Tracker:FindObjectForCode(section)

        if not target then
            print("Failed to resolve " .. section)
        else
            target.Owner:AddBadge(badge)
        end
    end
end

add_static_badges("images/wv_hyrule.png", HyruleWeatherVanes)
add_static_badges("images/wv_lorule.png", LoruleWeatherVanes)
