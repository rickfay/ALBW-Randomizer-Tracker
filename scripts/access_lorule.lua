-- Lorule Castle Area
function access_central_lorule()

    if notCracksanity() and has("merge") and hasAny({ "quake", "crack_hc" }) then
        return true
    end

    if hasAll({ "cracksanity", "merge" }) then
        if hasAny({ "crack_lc", "crack_vacant_house", "crack_left_lorule_paradox", "crack_right_lorule_paradox", "crack_swamp_pillar_lorule", "crack_thieves_town" }) then
            return true
        end
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

-- [Adv Glitched] Lorule Castle Area
function advanced_access_central_lorule()
    -- Mire SLZ to Swamp Area
    if access_misery_mire() and advanced_misery_mire_oob() then
        return true
    end
    return false
end

-- [Hell] Lorule Castle Area
function hell_access_central_lorule()
    if advanced_access_central_lorule() then
        return true
    end
    -- Mire SLZ to Swamp Area
    if access_misery_mire() and hell_misery_mire_oob() then
        return true
    end
    return false
end

-- Dark Ruins
function access_dark_ruins()
    if notCracksanity() and hasAll({ "merge", "quake" }) then
        return true
    end

    if hasAll({ "cracksanity", "merge" }) then
        if hasAny({ "crack_dark_ruins_pillar", "crack_kus_domain", "crack_dark_ruins_se" }) or (hasAll({ "crack_waterfall_lorule", "flippers" })) then
            return true
        end
    end

    if weather_vane_lorule("wv_dark") and (has("merge") or dark_palace()) then
        return true
    end

    return false
end

-- [Glitched] Dark Ruins
function glitched_access_dark_ruins()
    if access_dark_ruins() then
        return true
    end

    -- From Graveyard
    if access_lorule_graveyard() and boost() and hasAny({ "flippers", "hookshot" }) then
        return true
    end

    -- From Turtle Rock
    if hasAll({ "cracksanity", "crack_lorule_hotfoot", "scroll", "nicebombs" }) then
        return true
    end
    if hasAll({ "cracksanity", "crack_lake_lorule", "flippers", "scroll", "nicebombs" }) then
        return true
    end
    if hasAll({ "cracksanity", "crack_river_lorule", "flippers", "scroll", "nicebombs" }) then
        return true
    end
    if weather_vane_lorule("wv_turtle") and hasAll({ "flippers", "scroll", "nicebombs" }) then
        return true
    end

    return false
end

-- [Advanced] Dark Ruins
function advanced_access_dark_ruins()
    if glitched_access_dark_ruins() then
        return true
    end

    -- From Graveyard
    if access_lorule_graveyard() and boost() and hasAny({ "boots", "hookshot" }) then
        return true
    end
    return false
end

-- [Hell] Dark Ruins
function hell_access_dark_ruins()
    if advanced_access_dark_ruins() then
        return true
    end

    -- From Graveyard
    if access_lorule_graveyard() and hellBoost() and hasAny({ "boots", "hookshot" }) then
        return true
    end

    -- From Turtle Rock
    if hasAll({ "cracksanity", "crack_lorule_hotfoot", "scroll", "bombs" }) then
        return true
    end

    return false
end

-- Lorule Graveyard
function access_lorule_graveyard()
    if notCracksanity() and hasAll({ "merge", "quake" }) and hs_small_key() and attack() then
        return lampless()
    end

    if hasAll({ "cracksanity", "merge" }) and hasAny({ "crack_philosopher", "crack_graveyard_lorule" }) then
        return true
    end

    if weather_vane_lorule("wv_graveyard") then
        return true
    end

    return false
end

-- [Lampless] Lorule Graveyard
function lampless_access_lorule_graveyard()
    if notCracksanity() and hasAll({ "merge", "quake", "frod" }) and hs_small_key() then
        return true
    end
    return false
end

-- Skull Woods Area
function access_skull_woods_area()
    if notCracksanity() and hasAll({ "merge", "quake" }) then
        return true
    end

    if hasAll({ "cracksanity", "merge" }) and hasAny({ "crack_n-shaped_house", "crack_skull_woods_pillar", "crack_destroyed_house" }) then
        return true
    end

    if weather_vane_lorule("wv_skull") then
        return true
    end

    return false
end

-- Return if we can access the Weather Vane outside Turtle Rock
function access_turtleWV()
    if weather_vane_lorule("wv_turtle") then
        return true
    end
    if hasAll({ "not_cracksanity", "flippers", "quake", "merge", }) then
        return true
    end
    if hasAll({ "cracksanity", "flippers", "irod", "merge" }) and hasAny({ "crack_lake_lorule", "crack_river_lorule", "crack_lorule_hotfoot" }) then
        return true
    end
    return false
end

-- [Advanced] Return if we can access the Weather Vane outside Turtle Rock
function advanced_access_turtleWV()
    if access_turtleWV() then
        return true
    end
    if hasAll({ "not_cracksanity", "merge", "quake" }) and fakeFlippers() then
        return true
    end
    if hasAll({ "cracksanity", "merge" }) and has("crack_lorule_hotfoot") and fakeFlippers() then
        return true
    end
    if advanced_access_dark_ruins() and fakeFlippers() then
        return true
    end
    return false
end

-- [Hell] Return if we can access the Weather Vane outside Turtle Rock
function hell_access_turtleWV()
    if advanced_access_turtleWV() then
        return true
    end
    if notCracksanity() and hasAll({ "merge", "quake" }) and beeFakeFlippers() then
        return true
    end
    if hasAll({ "cracksanity" }) and has("crack_lorule_hotfoot") and beeFakeFlippers() then
        return true
    end
    if hell_access_dark_ruins() and beeFakeFlippers() then
        return true
    end
    return false
end


-- Return if we can enter Turtle Rock
function enterTR()
    return hasAll({ "irod", "merge" }) and access_turtleWV()
end

-- [Advanced] Return if we can enter Turtle Rock
function advanced_enterTR()
    return hasAll({ "irod", "merge" }) and advanced_access_turtleWV()
end

-- [Hell] Return if we can enter Turtle Rock
function hell_enterTR()
    return hasAll({ "irod", "merge" }) and hell_access_turtleWV()
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
            or hasAll({ "label_rosso_dp", "rosso" }) then
        return true
    end
    return false
end

-- Misery Mire
function access_misery_mire()
    if notCracksanity() and hasAll({ "merge", "quake" }) then
        return true
    end

    if hasAll({ "cracksanity", "merge" }) and
            (hasAny({ "crack_mire_exit", "crack_mire_pillar_right", "crack_mire_north", "crack_mire_middle", "crack_mire_sw" }) or
                    (hasAll({ "crack_mire_pillar_left", "flippers" })))
            or (has("crack_zaganaga") and has_mire_prize()) then
        return true
    end

    if weather_vane_lorule("wv_mire") then
        return true
    end

    return false
end
