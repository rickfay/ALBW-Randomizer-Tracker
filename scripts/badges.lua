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
Portals = {
    "@Your House/Portal",
    "@Lost Woods Pillar Portal/",
    "@Rosso's House/Rosso's House Portal",
    "@Death Mountain West Portal/",
    "@Floating Island/Floating Island Portal",
    "@Rosso's Ore Mine Portal/",
    "@Sanctuary /Sanctuary Portal",
    "@Graveyard Ledge/Graveyard Portal",
    "@Waterfall Portal/",
    "@Zora's Domain Portal/",
    "@Sahasrahla's House Portal/",
    "@Stylish Woman's House/Stylish Woman Portal",
    "@Eastern Pillar Portal/",
    "@Eastern Ruins SE Portal/",
    "@River Portal/",
    "@Swamp Pillar Portal/",
    "@Lake Hylia Portal/",
    "@Hyrule Hotfoot Portal/",
    "@Paradox Hyrule Left Portal/",
    "@Paradox Hyrule Right Portal/",
    "@Misery Mire Entrance Portal/",
    "@Desert/Desert North Portal",
    "@Desert Pillar Left Portal/",
    "@Desert Pillar Right Portal/",
    "@Desert Middle Portal/",
    "@Desert SW Portal/",
    "@Desert Palace Ledge/Desert Palace Portal",
    "@Inside Hyrule Castle/Hyrule Castle Portal",


    "@Vacant House Portal/",
    "@Skull Woods Pillar Portal/",
    "@Destroyed House Portal/",
    "@Lorule Death Mountain West Portal/",
    "@Lorule Floating Island/Lorule Floating Island Portal",
    "@Lorule Rosso's Ore Mine Portal/",
    "@Philosopher's Portal/",
    "@Lorule Graveyard/Lorule Graveyard Portal",
    "@Lorule Waterfall Portal/",
    "@Ku's Domain Portal/",
    "@n-Shaped House Portal/",
    "@Thieves' Town /Thieves' Town Portal",
    "@Dark Pillar Portal/",
    "@Dark Ruins SE Portal/",
    "@Lorule River Portal/",
    "@Lorule Swamp Pillar Portal/",
    "@Lorule Lake Portal/",
    "@Lorule Hotfoot Portal/",
    "@Paradox Lorule Left Portal/",
    "@Paradox Lorule Right Portal/",
    "@Misery Mire Exit Portal/",
    "@Misery Mire North/Misery Mire North Portal",
    "@Misery Mire Pillar Left Portal/",
    "@Misery Mire Pillar Right Portal/",
    "@Misery Mire Middle Portal/",
    "@Misery Mire SW Portal/",
    "@Misery Mire /Zaganaga Portal",
    "@Throne Room /Lorule Castle Portal"
}

-- Adds static badge to location
-- Badge references are thrown out as these badges are intended to be permanent location labels
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

add_static_badges("images/badges/wv_hyrule.png", HyruleWeatherVanes)
add_static_badges("images/badges/wv_lorule.png", LoruleWeatherVanes)
add_static_badges("images/badges/SlitS.png", Portals)
