-- Death Mountain is such a convoluted mess that it gets its own file to lay out all its logic.
-- Every function should take into account the many entry points into the Death Mountain Area (vanilla, 5x WVs, 6x Cracks)

-- Hyrule Death Mountain West Base
function access_dm_west_base()
    -- Vanilla
    if has("power_glove") then return true end

    -- Hyrule DM Weather Vane
    if weather_vane("wv_death_hyrule") then return true end

    -- Hera Weather Vane
    if weather_vane("wv_hera") then return true end


    if notCracksanity() and hasAll({ "merge", "quake" }) then
        -- Treacherous Tower Weather Vane
        if weather_vane_lorule("wv_treacherous_tower") then return true end

        -- DML Weather Vane
        -- IR Weather Vane
        if has("hookshot") and (weather_vane_lorule("wv_death_lorule") or weather_vane_lorule("wv_ice")) then return true end
    end

    if hasAll({ "cracksanity", "merge" }) then
        -- HyDeath West
        if has("crack_dm_west") then return true end

        -- HyROM
        if has("crack_rom") and has("hookshot") then return true end
    end

    return false
end

-- Hyrule Death Mountain West Top
function access_dm_west_top()
    -- Vanilla
    if access_dm_west_base() and has("merge") then return true end

    -- Hyrule DM Weather Vane
    if weather_vane("wv_death_hyrule") and has("merge") then return true end

    -- Hera Weather Vane
    if weather_vane("wv_hera") then return true end

    if notCracksanity() and hasAll({ "merge", "quake" }) then
        -- Treacherous Tower Weather Vane
        if weather_vane_lorule("wv_treacherous_tower") then return true end

        -- DML Weather Vane
        -- IR Weather Vane
        if has("hookshot") and (weather_vane_lorule("wv_death_lorule") or weather_vane_lorule("wv_ice")) then return true end
    end

    if hasAll({ "cracksanity", "merge" }) then
        -- HyDeath West
        if has("crack_dm_west") then return true end

        -- HyROM
        if hasAll({ "crack_rom", "hookshot" }) then return true end
    end

    return false
end

-- [Adv Glitched] Hyrule Death Mountain West Top
function adv_glitched_access_dm_west_top()
    if access_dm_west_top() then return true end
    -- Vanilla
    if hasAny({ "bottle", "bluemail" }) then return true end

    if notCracksanity() and hasAll({ "merge", "quake" }) then
        -- Treacherous Tower Weather Vane
        if weather_vane_lorule("wv_treacherous_tower") and has("hookshot") and boost() then return true end
    end

    return false
end

-- [Hell] Hyrule Death Mountain West Top
function hell_access_dm_west_top()
    if adv_glitched_access_dm_west_top() then return true end
    if notCracksanity() and weather_vane_lorule("wv_treacherous_tower") and hasAll({ "merge", "quake", "hookshot", "bombs" }) then return true end
    return false
end

-- Hyrule Death Mountain East Top
function access_dm_east_top()
    -- Vanilla
    if hasAll({ "power_glove", "merge", "hookshot" }) then return true end

    -- Hyrule DM Weather Vane
    if weather_vane("wv_death_hyrule") and hasAll({ "merge", "hookshot" }) then return true end

    -- Hera Weather Vane
    if weather_vane("wv_death_hyrule") and has("hookshot") then return true end

    if notCracksanity() and hasAll({ "merge", "quake", "hookshot" }) then

        -- Treacherous Tower Weather Vane
        if weather_vane_lorule("wv_treacherous_tower") then return true end

        -- DML Weather Vane
        if weather_vane_lorule("wv_death_lorule") then return true end

        -- IR Weather Vane
        if weather_vane_lorule("wv_ice") then return true end
    end

    if hasAll({ "cracksanity", "merge" }) then
        -- HyDeath West
        if hasAll({ "crack_dm_west", "hookshot" }) then return true end

        -- HyROM
        if has("crack_rom") then return true end
    end

    return false
end

-- [Adv Glitched] Hyrule Death Mountain East Top
function adv_glitched_access_dm_east_top()
    if access_dm_east_top() then return true end
    if hasAny({ "bottle", "bluemail" }) and has("hookshot") then return true end
    if weather_vane("wv_hera") and has("hookshot") then return true end

    return false
end

-- Hyrule Death Mountain East Bottom
function access_dm_east_bottom()
    -- Vanilla
    if hasAll({ "power_glove", "merge", "hookshot" }) then return true end

    -- Hyrule DM Weather Vane
    if weather_vane("wv_death_hyrule") and hasAll({ "merge", "hookshot" }) then return true end

    -- Hera Weather Vane
    if weather_vane("wv_hera") and hasAll({ "merge", "hookshot" }) then return true end
    
    if notCracksanity() and hasAll({ "merge", "quake", "hookshot" }) then

        -- Treacherous Tower Weather Vane
        if weather_vane_lorule("wv_treacherous_tower") then return true end

        -- DML Weather Vane
        if weather_vane_lorule("wv_death_lorule") then return true end

        -- IR Weather Vane
        if weather_vane_lorule("wv_ice") then return true end
    end

    if hasAll({ "cracksanity", "merge" }) then
        -- HyDeath West
        if hasAll({ "crack_dm_west", "hookshot" }) then return true end

        -- HyROM
        if has("crack_rom") then return true end
    end

    return false
end

-- [Adv Glitched] Hyrule Death Mountain East Bottom
function adv_glitched_access_dm_east_bottom()
    if access_dm_east_bottom() then return true end
    if hasAny({ "bottle", "bluemail" }) and has("hookshot") and (has("merge") or (hasAll({ "trod", "boots" }) or has("nicebombs"))) then return true end
    if weather_vane("wv_hera") and has("hookshot") and (hasAll({ "trod", "boots" }) or has("nicebombs")) then return true end

    return false
end


-- Lorule Death Mountain West
function access_ldm_west()

    if notCracksanity() and hasAll({ "merge", "quake" }) then
        -- Vanilla
        if has("power_glove") then return true end

        -- Hyrule DM Weather Vane
        if weather_vane("wv_death_hyrule") then return true end

        -- Hera Weather Vane
        if weather_vane("wv_hera") then return true end
    end

    -- Treacherous Tower Weather Vane
    if weather_vane_lorule("wv_treacherous_tower") then return true end

    -- DML Weather Vane
    if weather_vane_lorule("wv_death_lorule") and has("hookshot") then return true end

    -- IR Weather Vane
    if weather_vane_lorule("wv_ice") and hasAll({ "merge", "hookshot" }) then return true end

    if hasAll({ "cracksanity", "merge" }) then
        -- DML West Crack
        if has("crack_lorule_dm_west") then return true end

        -- ROML Crack
        if has("crack_rom_lorule") and has("hookshot") then return true end

        -- LoFI Crack
        if has("crack_lofi") and hasAll({ "trod", "hookshot" }) then return true end
    end

    return false
end

-- [Glitched] Lorule Death Mountain West
function glitched_access_ldm_west()
    if access_ldm_west() then return true end

    -- Power Glove Skip
    if notCracksanity() and hasAll({"merge", "quake"}) then
        return true
    end

    -- LoFI Crack
    if has("crack_lofi") and hasAll({ "boots", "hookshot" }) then return true end
    return false
end

-- Lorule Death Mountain East Base
function access_ldm_east_base()

    if notCracksanity() and hasAll({ "merge", "hookshot", "quake" }) then
        -- Vanilla
        if hasAll({ "power_glove" }) then return true  end

        -- Hyrule DM Weather Vane
        if weather_vane("wv_death_hyrule") then return true end

        -- Hera Weather Vane
        if weather_vane("wv_hera") then return true end
    end

    -- DML Weather Vane
    if weather_vane_lorule("wv_death_lorule") then return true end

    -- IR Weather Vane
    if weather_vane_lorule("wv_ice") and has("merge") then return true end

    if hasAll({ "cracksanity", "merge" }) then

        -- ROML Crack
        if has("crack_rom_lorule") then return true end

        -- LoFI Crack
        if hasAll({ "crack_lofi", "trod" }) then return true end
    end

    return false
end

-- [Glitched] Lorule Death Mountain East Base
function glitched_access_ldm_east_base()
    if access_ldm_east_base() then return true end
    if notCracksanity() and hasAll({ "merge", "quake", "hookshot" }) then return true end
    if has("hookshot") and weather_vane_lorule("wv_treacherous_tower") and (boost() or has("trod")) then return true end
    if hasAll({ "cracksanity", "crack_lorule_dm_west", "hookshot", "merge" }) and (boost() or has("trod")) then return true end
    if hasAll({ "cracksanity", "crack_lofi", "boots", "merge" }) then return true end
    return false
end

-- [Hell] Lorule Death Mountain East Base
function hell_access_ldm_east_base()
    if glitched_access_ldm_east_base() then return true end
    if hasAll({ "bombs", "hookshot" }) and weather_vane_lorule("wv_treacherous_tower") then return true end
    if hasAll({ "bombs", "cracksanity", "crack_lorule_dm_west", "hookshot", "merge" }) then return true end
    return false
end

-- Lorule Death Mountain East Top
function access_ldm_east_top()

    if notCracksanity() then
        -- Vanilla
        if hasAll({ "power_glove", "merge", "hookshot", "quake" }) then return true end

        -- Hyrule DM Weather Vane
        if weather_vane("wv_death_hyrule") and hasAll({ "merge", "hookshot", "quake" }) then return true end

        -- Hera Weather Vane
        if weather_vane("wv_hera") and hasAll({ "hookshot", "merge", "quake" }) then return true end
    end

    -- DML Weather Vane
    if weather_vane_lorule("wv_death_lorule") and has("merge") then return true end

    -- IR Weather Vane
    if weather_vane_lorule("wv_ice") then return true end

    if hasAll({ "cracksanity", "merge" }) then
        -- ROML Crack
        if has("crack_rom_lorule") then return true end

        -- LoFI Crack
        if has("crack_lofi") and has("trod") then return true end
    end

    return false
end

-- [Glitched] Lorule Death Mountain East Top
function glitched_access_ldm_east_top()
    if access_ldm_east_top() then return true end
    if notCracksanity() and hasAll({ "merge", "quake", "hookshot" }) then return true end
    if has("hookshot") and weather_vane_lorule("wv_treacherous_tower") and (boost() or has("trod")) then return true end
    if hasAll({ "cracksanity", "crack_lorule_dm_west", "hookshot" }) and (boost() or has("trod")) then return true end
    -- LoFI Crack
    if hasAll({ "cracksanity", "crack_lofi", "boots" }) then return true end
    return false
end

-- [Hell] Lorule Death Mountain East Top
function hell_access_ldm_east_top()
    if glitched_access_ldm_east_top() then return true end
    if hasAll({ "bombs", "hookshot" }) and weather_vane_lorule("wv_treacherous_tower") then return true end
    if hasAll({ "bombs", "cracksanity", "crack_lorule_dm_west", "hookshot" }) then return true end
    return false
end
