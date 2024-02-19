
-- Central Lorule
function access_central_lorule()

    if notPortalShuffle() and has("merge") and hasAny({ "quake", "portal_hc" }) then return true end

    if hasAll({ "portal_shuffle", "merge" }) then
        if hasAny({ "portal_lc", "portal_vacant_house", "portal_left_lorule_paradox", "portal_right_lorule_paradox", "portal_swamp_pillar_lorule", "portal_thieves_town" }) then return true end
    end

    if weather_vane_lorule("wv_vacant_house")
        or weather_vane_lorule("wv_lorule_castle")
        or weather_vane_lorule("wv_thieves")
        or weather_vane_lorule("wv_blacksmith")
        or (weather_vane_lorule("wv_swamp") and hasAny({ "hookshot", "flippers" })) then
        return true
    end

    return false
end

-- [Adv Glitched] Central Lorule
function advanced_access_central_lorule()
    -- Mire SLZ to Swamp Area
    if access_misery_mire() and advanced_misery_mire_oob() then return true end
    return false
end

-- [Hell] Central Lorule
function hell_access_central_lorule()
    if advanced_misery_mire_oob() then return true end
    -- Mire SLZ to Swamp Area
    if access_misery_mire() and hell_misery_mire_oob() then return true end
    return false
end

-- Dark Ruins
function access_dark_ruins()
    if notPortalShuffle() and hasAll({ "merge", "quake" }) then return true end

    if hasAll({ "portal_shuffle", "merge" }) then
        if hasAny({ "portal_dark_ruins_pillar", "portal_kus_domain", "portal_dark_ruins_se" }) or (hasAll({ "portal_waterfall_lorule", "flippers" })) then return true end
    end

    if weather_vane_lorule("wv_dark") and hasAny({ "merge", "gulley" }) then return true end

    return false
end

-- [Glitched] Dark Ruins
function glitched_access_dark_ruins()
    if access_dark_ruins() then return true end

    -- From Graveyard
    if access_lorule_graveyard() and boost() and hasAny({ "flippers", "hookshot" }) then return true end

    -- From Turtle Rock
    if hasAll({ "portal_shuffle", "portal_lorule_hotfoot", "scroll", "nicebombs" }) then return true end
    if hasAll({ "portal_shuffle", "portal_lake_lorule", "flippers", "scroll", "nicebombs" }) then return true end
    if hasAll({ "portal_shuffle", "portal_river_lorule", "flippers", "scroll", "nicebombs" }) then return true end
    if weather_vane_lorule("wv_turtle") and hasAll({ "flippers", "scroll", "nicebombs" }) then return true end

    return false
end

-- [Advanced] Dark Ruins
function advanced_access_dark_ruins()
    if glitched_access_dark_ruins() then return true end

    -- From Graveyard
    if access_lorule_graveyard() and boost() and hasAny({ "boots", "hookshot" }) then return true end
    return false
end

-- [Hell] Dark Ruins
function hell_access_dark_ruins()
    if advanced_access_dark_ruins() then return true end

    -- From Graveyard
    if access_lorule_graveyard() and hellBoost() and hasAny({ "boots", "hookshot" }) then return true end

    -- From Turtle Rock
    if hasAll({ "portal_shuffle", "portal_lorule_hotfoot", "scroll", "bombs" }) then return true end

    return false
end

-- Lorule Graveyard
function access_lorule_graveyard()
    if notPortalShuffle() and hasAll({ "merge", "quake" }) and attack() and has("lamp") then return true end

    if hasAll({ "portal_shuffle", "merge" }) and hasAny({ "portal_philosopher", "portal_graveyard_lorule" }) then return true end

    if weather_vane_lorule("wv_graveyard") then return true end

    return false
end

-- [Lampless] Lorule Graveyard
function lampless_access_lorule_graveyard()
    if notPortalShuffle() and hasAll({ "merge", "quake", "frod" }) then return true end
    return false
end

-- Skull Woods Area
function access_skull_woods_area()
    if notPortalShuffle() and hasAll({ "merge", "quake" }) then return true end

    if hasAll({ "portal_shuffle", "merge" }) and hasAny({ "portal_n-shaped_house", "portal_skull_woods_pillar", "portal_destroyed_house" }) then return true end

    if weather_vane_lorule("wv_skull") then return true end

    return false
end

-- Return if we can enter Turtle Rock
function enterTR()
    if hasAll({ "not_portal_shuffle", "irod", "flippers", "quake", "merge",  }) then return true end
    if weather_vane_lorule("wv_turtle") and hasAll({ "irod", "merge" }) then return true end
    if hasAll({ "portal_shuffle", "flippers", "irod" }) and hasAny({ "portal_lake_lorule", "portal_river_lorule", "portal_lorule_hotfoot" }) then return true end
    return false
end

-- [Advanced] Return if we can enter Turtle Rock
function advanced_enterTR()
    if enterTR() then return true end
    if hasAll({ "not_portal_shuffle", "merge", "quake", "irod" }) and fakeFlippers() then return true end
    if hasAll({ "portal_shuffle", "irod" }) and has("portal_lorule_hotfoot") and fakeFlippers() then return true end
    if has("irod") and advanced_access_dark_ruins() and fakeFlippers() then return true end
    return false
end

-- [Hell] Return if we can enter Turtle Rock
function hell_enterTR()
    if advanced_enterTR() then return true end
    if notPortalShuffle() and hasAll({ "merge", "quake", "irod" }) and beeFakeFlippers() then return true end
    if hasAll({ "portal_shuffle", "irod" }) and has("portal_lorule_hotfoot") and beeFakeFlippers() then return true end
    if has("irod") and hell_access_dark_ruins() and beeFakeFlippers() then return true end
    return false
end

function has_mire_prize()
    if hasAll({ "label_power_dp", "power" })
        or hasAll({ "label_wisdom_dp", "wisdom" })
        or hasAll({ "label_courage_dp", "courage" })
        or hasAll({ "label_gulley_dp", "gulley" })
        or hasAll({ "label_oren_dp", "oren" })
        or hasAll({ "label_seres_dp", "seres" })
        or hasAll({ "label_osfala_dp", "osfala" })
        or hasAll({ "label_impa_dp", "impa" })
        or hasAll({ "label_irene_dp", "irene" })
        or hasAll({ "label_rosso_dp", "rosso" }) then return true
    end
    return false
end

-- Misery Mire
function access_misery_mire()
    if notPortalShuffle() and hasAll({ "merge", "quake" }) then return true end

    if hasAll({ "portal_shuffle", "merge"}) and hasAny({ "portal_mire_exit", "portal_mire_pillar_left", "portal_mire_pillar_right", "portal_mire_north", "portal_mire_middle", "portal_mire_sw" })
        or has_mire_prize() then return true end

    if weather_vane_lorule("wv_mire") then return true end

    return false
end
