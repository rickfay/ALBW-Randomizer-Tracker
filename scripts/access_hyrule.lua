-- Desert of Mystery
function access_desert()
    if hasAll({ "not_portal_shuffle", "merge", "quake" }) then return true end
    if weather_vane("wv_desert") then return true end
    if hasAll({ "portal_shuffle", "merge" }) and hasAny({ "portal_desert_north", "portal_desert_pillar_left", "portal_desert_pillar_right", "portal_desert_middle", "portal_desert_sw" }) then return true end
    if hasAll({ "portal_shuffle", "merge" , "portal_desert_palace", "scoot" }) then return true end
    return false
end

-- Desert Palace
function access_desert_palace()
    if weather_vane("wv_desert") and has("srod") then return true end
    if notPortalShuffle() and hasAll({ "merge", "quake", "srod" }) then return true end
    if hasAll({ "portal_shuffle", "portal_desert_sw", "srod" }) then return true end
    if hasAll({ "portal_shuffle", "portal_desert_palace" }) then return true end
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
    return hasAll({ "merge", "srod", "titansmitt" }) and switch() and attack_normal()
end

-- [HARD] Return if we can reach Desert Palace 2F
function hard_dp2F()
    return hasAll({ "merge", "srod", "titansmitt" }) and switch() and attack()
end