-- Returns true if the player has the given item or setting
function has(item)
    return Tracker:ProviderCountForCode(item) == 1
end

-- Returns true if the player can use any of the given items
function hasAny(items)
    for _, item in ipairs(items) do
        if has(item) then
            return true
        end
    end
    return false
end

-- Returns true if the player can use ALL of the given items
function hasAll(items)
    for _, item in ipairs(items) do
        if not has(item) then
            return false
        end
    end
    return true
end

function break_skull()
    return hasAny({ "sword", "bow", "boomerang", "hookshot", "power_glove", "boots", "hammer", "bombs", "frod", "irod", "srod" })
end

function weather_vane(vane)
    return hasAll({ "bell", vane })
end

function weather_vane_lorule(vane)
    return has(vane) and warpLorule()
end

-- Returns the count of the given item or setting
function count(item)
    return Tracker:ProviderCountForCode(item)
end

-- Returns true if the player has at least a given amount of an item or setting
function has_amount(item, amount)
    return Tracker:ProviderCountForCode(item) >= amount
end

-- Returns true if we're using the specified settings, or (true, SequenceBreak) if not
function true_for(logic)
    if has(logic) then
        return true
    else
        return true, AccessibilityLevel.SequenceBreak
    end
end

-- Can we attack according to normal logic
function attack_normal()
    return hasAny({ "fsword", "bow", "bombs", "frod", "irod", "hammer", "boots" })
end

-- Return if the player can deal damage
function attack()
    if attack_normal() then
        return true
    elseif hasAny({ "lamp", "net" }) then
        return true_for("hard")
    else
        return false
    end
end

-- Return if the player can deal damage to enemies that are immune to fire
function fire_enemy()
    if hasAny({ "fsword", "bow", "bombs", "irod", "hammer", "boots" }) then
        return true
    elseif has("net") then
        return true_for("hard")
    else
        return false
    end
end

-- Return if the player can attack Margomill
-- This is the same as attack(), minus the ice rod
function margomill()
    if hasAny({ "fsword", "bow", "bombs", "frod", "hammer", "boots" }) then
        return true
    elseif hasAny({ "lamp", "net" }) then
        return true_for("hard")
    end

    return false
end

-- Return if the player can attack Knucklemaster
-- This is the same as attack(), minus the bow
function knucklemaster()
    if hasAny({ "fsword", "bombs", "frod", "irod", "hammer", "boots" }) then
        return true
    elseif hasAny({ "lamp", "net" }) then
        return true_for("hard")
    end

    return false
end

-- Return if the player can stun enemies
-- Foul Fruit is not considered here as its single-use nature makes it rarely useful
function stun()
    return hasAny({ "boomerang", "hookshot" })
end

function boulder()
    return hasAny({ "bombs", "hammer" })
end

-- Return if the player can Fire Rod Boost or Lemon Boost to small ledges
-- Regular Bomb Boosting is not considered unless the player enables the option
-- Bee Boosting is also considered if enabled and the player doesn't have the Bee Badge
function boost()
    return hasAny({ "frod", "nicebombs" })
end

-- Return if the player can perform Fake Flippers
function fakeFlippers()
    return has("boots") and boost()
end

-- Fake Flippers using either a Bee or regular Bomb to boost
function beeFakeFlippers()
    return has("boots") and (hasAny({ "bombs", "frod" }) or beeBoost())
end

function notPortalShuffle()
    return not has("portal_shuffle")
end

-- Return if the player can perform a Shield Rod Clip
-- This must be enabled in options to be considered, and the player needs a sword to use the shield
function shieldRodClip()
    return hasAll({ "fsword", "trod", "shield" })
end

-- Return if the player is able to escape an otherwise softlock-able area
-- Having Bell would be ideal, but death warping using Bombs or Fire Rod also works
function escape()
    return hasAny({ "bell", "bombs", "frod" })
end

-- Return if the player is able to escape an otherwise softlock-able area in a Dungeon
-- Having Scoot Fruit would be ideal, but death warping using Bombs or Fire Rod also works
function dungeon_escape()
    return hasAny({ "scoot", "bombs", "frod" })
end

-- Return if Link has a Fire source
-- This is mostly for checking if Link can light torches
function fire()
    return hasAny({ "lamp", "frod" })
end

function canExtinguishTorches()
    return hasAny({ "sword", "bombs", "trod", "irod", "net" })
end

-- Return if Link can hit Crystal Switches
-- Pots aren't accounted for here, but may make hitting some switches possible
function switch()
    return hasAny({ "fsword", "bow", "boomerang", "hookshot", "bombs", "irod", "hammer", "boots" })
end

-- Return if Link can hit Crystal Switches
-- This is the same as switch(), minus the ice rod
function shielded_switch()
    return hasAny({ "fsword", "bow", "boomerang", "hookshot", "bombs", "hammer", "boots" })
end

-- Return if Link either has lamp, or lampless is enabled
function lampless()
    --return hasAny({ "lamp", "lampless" })

    if has("lamp") then
        return true
    else
        return true_for("lampless")
    end
end

function hellBoost()
    return hasAny({ "frod", "bombs" }) or beeBoost()
end

-- Bee Boosting
-- This is a hard opt-in trick, and it can't be done if the player has the Bee Badge
function beeBoost()
    return cutGrass() and hasAny({ "beeBoost_show", "hell" }) and not has("bee_badge");
end

function cutGrass()
    return hasAny({ "fsword", "boomerang", "bombs", "frod", "irod", "lamp", "boots" });
end

-- Can defeat Yuga 1 in Eastern Palace
function yuga_eastern()
    if has("bow") then
        return true
    elseif has("bombs") or (hasAny({ "boomerang", "hookshot" }) and attack()) or hasAll({ "nice_mode", "niceirod" }) then
        return true_for("hard")
    elseif hasAny({ "irod", "msword" }) then
        return true_for("hell")
    elseif has("niceirod") then
        return true, AccessibilityLevel.SequenceBreak
    else
        return false
    end
end

function notNiceMode()
    return not has("nice_mode")
end

-- Can use Portals
-- Not for Hyrule Castle portal (doesn't need Quake)
function portal()
    return hasAll({ "quake", "merge" })
end


-- Can reach top part of East Lorule Death Mountain, where the Ice Ruins entrance is.
function loruleDeathEastTop()
    if hasAll({ "power_glove", "merge", "hookshot", "quake" }) then
        return true
    end

    if has("bell") then
        if hasAny({ "wv_death_hyrule", "wv_hera" }) and hasAll({ "merge", "quake", "hookshot" }) then
            return true
        end

        if hasAll({ "merge", "quake" }) or has("yuga") then
            if has("wv_ice") or hasAll({ "wv_death_lorule", "merge" }) then
                return true
            end
        end
    end


end

-- Can access the Dark Ruins main area (outside the maze)
-- Merge or Gulley is needed to go from the Weather Vane to the main area
-- Graveyard -> Dark access is possible with glitches
function darkRuins()
    if portal() or (hasAll({ "yuga", "bell", "wv_dark" }) and hasAny({ "merge", "gulley" })) then
        return true
    elseif hasAll({ "yuga", "bell", "wv_graveyard" }) then
        if boost() and hasAny({ "flippers", "hookshot" }) then
            return true_for("glitched")
        elseif fakeFlippers() then
            return true_for("advanced")
        elseif beeFakeFlippers() then
            return true_for("hell")
        end
    end

    return false
end

function turtleLake()
    if portal() or hasAll({ "yuga", "bell", "wv_turtle", "flippers" }) then
        return true
    elseif darkRuins() then
        if has("flippers") then
            return true_for("glitched")
        elseif fakeFlippers() then
            return true_for("advanced")
        elseif beeFakeFlippers() then
            return true_for("hell")
        end
    end
end

-- Can reach House of Gales 2F (assume TRod)
function hog2F()
    if has("merge") and switch() then
        return true
    elseif hasAny({ "bow", "boomerang", "hookshot", "bombs", "irod", "msword" }) or hasAll({ "great_spin", "fsword" }) then
        return true_for("hard")
    else
        return false
    end
end

-- Can reach House of Gales 3F (assume TRod)
function hog3F()
    if hog2F() and has("merge") then
        if fire_enemy() then
            return fire_enemy()
        else
            return true_for("glitched")
        end
    else
        return false
    end
end

-- Can open Thieves' Hideout B1 Door
function thB1DoorOpen()
    if has("merge") and switch() then
        return true
    elseif has("boots") then
        if hasAny({ "boomerang", "irod" }) then
            return has("glitched")
        elseif has("bombs") then
            return has("hell")
        end
    end
    return false
end

-- Can open Thieves' Hideout B2 Door
function thB2DoorOpen()
    if thB1DoorOpen() and has("merge") and hasAny({ "progression_enemies", "bombs" }) then
        return true
    elseif (has("merge") or dungeon_escape()) and adv_th_statue_clip() then
        return has("advanced")
    elseif has("bombs") then
        return has("hell")
    end
    return false
end

function thB1B2DoorsOpen()
    return thB1DoorOpen() and thB2DoorOpen()
end

-- Can drain the water in Thieves' Hideout B3
function thDrainWaterB3()
    if thB1B2DoorsOpen() and hasAll({ "merge", "flippers" }) then
        return true
    end

    if has("trod") then
        if adv_th_statue_clip() then
            return has("advanced")
        elseif hell_th_statue_clip() then
            return has("hell")
        end
    end

    return false
end

--
function thEscapeEquipment()
    return has("merge") and thB1B2DoorsOpen() and thDrainWaterB3()
end

-- Can statue clip OOB in Thieves' Hideout under Adv. Glitched Logic
function adv_th_statue_clip()
    return has("merge") and hasAny({ "bow", "boomerang", "irod", "bombs" })
end

-- Can statue clip OOB in Thieves' Hideout under Hell Logic
function hell_th_statue_clip()
    return has("bombs")
            or (has("msword") and (hasAny({ "merge", "boomerang", "irod", "great_spin" })))
            or adv_th_statue_clip()
end

-- Can reach the Thieves' Hideout Escape
function thEscape()
    if hasAll({ "merge", "flippers" }) and attack() then
        return true
    elseif has("trod") and hasAny({ "bombs", "irod" }) then
        return true_for("advanced")
    else
        return false
    end
end

function portal_clip()
    return has("boomerang") or hasAll({ "not_nice_mode", "hookshot" }) or shieldRodClip()
end

-- Return if we can get OoB on the south wall of Misery Mire
function advanced_misery_mire_oob()
    if has("nicebombs") then return true end

    if (
            access_misery_mire() and hasAll({ "irod", "trod" }) or (
                    has("merge") and (
                            (has("portal_shuffle") and hasAny({ "portal_mire_sw", "portal_mire_middle" })) or
                            (hasAll({ "not_portal_shuffle", "quake" }) and (hasAny({ "srod", "scroll" }) or boost()))
                    )
            )
    ) and (boost() or (has("trod") and portal_clip()))
    then
        return true end

    return false
end

-- Return if we can get OoB on the south wall of Misery Mire
function hell_misery_mire_oob()
    if advanced_misery_mire_oob() then return true end

    if has("bombs") then return true end

    if (access_misery_mire() and hasAll({ "irod", "trod" }) or (
            has("merge") and (
                    hasAll({ "not_portal_shuffle", "quake" }) or (has("portal_shuffle") and hasAny({ "portal_mire_sw", "portal_mire_middle" }))
            )
    )) and (
            has("frod") or (has("trod") and portal_clip())
    ) then return true end

    return false
end

-- Return if we have any portals in Central Lorule, including the Lorule Castle Portal
function access_central_lorule()
    return has("merge") and (
            hasAny({ "portal_lc", "portal_vacant_house", "portal_thieves_town", "portal_swamp_pillar_lorule", "portal_left_lorule_paradox", "portal_right_lorule_paradox" }) or (
                    warpLorule() and (
                            hasAny({ "wv_vacant_house", "wv_blacksmith", "wv_thieves", "wv_lorule_castle" }) or (
                                    has("wv_swamp") and hasAny({ "hookshot", "flippers" })
                            )
                    )
            )
    )
end

function warpLorule()
    return hasAll({ "bell", "merge" }) and ((notPortalShuffle() and has("quake")) or hasAny({ "portal_vacant_house", "portal_skull_woods_pillar", "portal_destroyed_house", "portal_lorule_dm_west", "portal_lofi", "portal_rom_lorule", "portal_philosopher", "portal_graveyard_lorule", "portal_waterfall_lorule", "portal_kus_domain", "portal_n-shaped_house", "portal_thieves_town", "portal_dark_ruins_pillar", "portal_dark_ruins_se", "portal_river_lorule", "portal_swamp_pillar_lorule", "portal_lake_lorule", "portal_lorule_hotfoot", "portal_left_lorule_paradox", "portal_right_lorule_paradox", "portal_mire_exit", "portal_mire_north", "portal_mire_pillar_left", "portal_mire_pillar_right", "portal_mire_middle", "portal_mire_sw", "portal_zaganaga", "portal_lc" }))
end

function claimDesertPrize()
    return hasAll({ "label_power_dp", "power" })
            or hasAll({ "label_wisdom_dp", "wisdom" })
            or hasAll({ "label_courage_dp", "courage" })
            or hasAll({ "label_gulley_dp", "gulley" })
            or hasAll({ "label_oren_dp", "oren" })
            or hasAll({ "label_seres_dp", "seres" })
            or hasAll({ "label_osfala_dp", "osfala" })
            or hasAll({ "label_impa_dp", "impa" })
            or hasAll({ "label_irene_dp", "irene" })
            or hasAll({ "label_rosso_dp", "rosso" })
end

-- Return if we can perform Reverse Desert Palace
function reverseDP()
    return hasAll({ "not_portal_shuffle", "merge", "portal_desert_palace", "quake" })
            or hasAll({ "portal_shuffle", "merge", "portal_desert_palace" })
end

-- Can players complete Sanctuary
function sanctuary()
    return (has("lamp") and attack_normal()) or hasAll({ "lampless", "frod" })
end

-- [Hard] Can players complete Sanctuary
function hard_sanctuary()
    return (has("lamp") and attack()) or hasAll({ "lampless", "frod" })
end

-- [Lampless] Can players complete Sanctuary
function lampless_sanctuary()
    return has("frod") or sanctuary()
end

-- Never in logic
function barrier_skip()
    return hell_access_central_lorule() and hasAll({ "boots", "trod", "bombs" }) and hasAny({ "hookshot", "boomerang" }) and not lc_requirement()
end


function yuga2()
    return hasAny({ "fsword", "bombs", "frod", "irod", "hammer" })
end

-- Map the Lorule Castle requirement from a progressive item to a number
function lc_requirement()

    local requirement
    if has("lc_requirement_7") then
        requirement = 7
    elseif has("lc_requirement_6") then
        requirement = 6
    elseif has("lc_requirement_5") then
        requirement = 5
    elseif has("lc_requirement_4") then
        requirement = 4
    elseif has("lc_requirement_3") then
        requirement = 3
    elseif has("lc_requirement_2") then
        requirement = 2
    elseif has("lc_requirement_1") then
        requirement = 1
    else
        requirement = 0
    end

    return count("sage") >= requirement
end

-- Return if we can enter Lorule Castle, either with Sages or via the Hyrule Castle Portal
function canEnterLC()
    if notPortalShuffle() and hasAll({ "merge", "quake" }) and lc_requirement() then return true end
    if hasAll({ "portal_lc", "trials_door_open", "merge" }) then return true end
    return false
end

-- Return if we can reach Lorule Castle 2F
function lc2F()
    if attack() then
        return true
    else
        return true_for("hard")
    end
end

-- Map the Yuganon requirement from a progressive item to a number
function yg_requirement()
    return true -- Add this back when it's working

    --local requirement
    --if has("yg_requirement_7") then
    --    requirement = 7
    --elseif has("yg_requirement_6") then
    --    requirement = 6
    --elseif has("yg_requirement_5") then
    --    requirement = 5
    --elseif has("yg_requirement_4") then
    --    requirement = 4
    --elseif has("yg_requirement_3") then
    --    requirement = 3
    --elseif has("yg_requirement_2") then
    --    requirement = 2
    --elseif has("yg_requirement_1") then
    --    requirement = 1
    --else
    --    requirement = 0
    --end
    --
    --return count("sage") >= requirement
end

-- Returns if we can complete the Lorule Castle Trials normally, without glitches or portals.
function lc_trials()
    return has("merge") and lc_requirement() and (has("trials_skipped") or hasAll({ "merge", "hookshot", "bombs", "$fire" }))

end

-- Returns only if we can reach the final boss, NOT if we can obtain Zelda's check or win the fight
function can_reach_final_boss()
    return has("merge") and yg_requirement() and ((has("portal_lc")) or (lc_requirement() and (has("trials_skipped") or hasAll({ "merge", "hookshot" }))))
end

-- Returns only if we can perform Trial's Skip to fight Yuganon, NOT if we can obtain Zelda's check or win the fight
function can_skip_trials()
    if lc_requirement() and yg_requirement() and hasAll({ "merge", "sword" }) then
        if has("bombs") then
            return true_for("advanced")
        elseif has("niceirod") then
            return true, AccessibilityLevel.SequenceBreak
        end
    end

    return false
end

-- Returns if we can logically play tennis with Yuganon
function can_play_tennis()
    if has("sword") or hasAll({ "swordless", "net" }) then
        return true
    elseif has("net") then
        return true_for("hard")
    end

    return false
end

-- Return if we can reach Zelda in Lorule Castle
function zelda()
    if can_reach_final_boss() then
        return can_play_tennis()
    elseif can_play_tennis() then
        return can_skip_trials()
    else
        return false
    end
end

function countNiceItems()
    return count("maiamai_bow") + count("maiamai_boomerang") + count("maiamai_hookshot") + count("maiamai_hammer") + count("maiamai_bombs") + count("maiamai_fire_rod") + count("maiamai_ice_rod") + count("maiamai_tornado_rod") + count("maiamai_sand_rod")
end

function maiamaiUpgradeAvailable()
    if has("maiamai_100") then
        return 10
    elseif has("maiamai_90") then
        return 9
    elseif has("maiamai_80") then
        return 8
    elseif has("maiamai_70") then
        return 7
    elseif has("maiamai_60") then
        return 6
    elseif has("maiamai_50") then
        return 5
    elseif has("maiamai_40") then
        return 4
    elseif has("maiamai_30") then
        return 3
    elseif has("maiamai_20") then
        return 2
    elseif has("maiamai_10") then
        return 1
    else
        return 0
    end
end

function canUpgradeItem()
    return maiamaiUpgradeAvailable() > countNiceItems()
end