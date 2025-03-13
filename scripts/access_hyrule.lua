-- Desert of Mystery
function access_desert()
    if hasAll({ "not_cracksanity", "merge", "quake" }) then return true end
    if weather_vane("wv_desert") then return true end
    if hasAll({ "cracksanity", "merge" }) and hasAny({ "crack_desert_north", "crack_desert_pillar_left", "crack_desert_pillar_right", "crack_desert_middle", "crack_desert_sw" }) then return true end
    if hasAll({ "cracksanity", "merge" , "crack_desert_palace", "scoot" }) then return true end
    return false
end

-- Desert Palace
function access_desert_palace()
    if weather_vane("wv_desert") and has("srod") then return true end
    if notCracksanity() and hasAll({ "merge", "quake", "srod" }) then return true end
    if hasAll({ "cracksanity", "crack_desert_sw", "srod" }) then return true end
    if hasAll({ "cracksanity", "crack_desert_palace" }) then return true end
    if access_desert() and hasAll({ "srod", "scroll" }) then return true end

    return false
end

-- [Glitched] Desert Palace
function glitched_access_desert_palace()
    if access_desert_palace() then return true end
    if has("srod") and access_desert() then return true end

    return false
end

-- Return if we can reach Desert Palace 2F
function dp2F()
    return (has("keysy_small") or has_amount("dp_small_keys", 2))
            and hasAll({ "merge", "srod", "titansmitt" }) and switch() and attack()
end