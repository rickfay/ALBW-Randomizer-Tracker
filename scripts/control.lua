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

-- Returns true if the player has ALL of the given items
function hasAll(items)
    for _, item in ipairs(items) do
        if not has(item) then
            return false
        end
    end
    return true
end

-- Returns true if the player has NONE of the given items
function hasNone(items)
    for _, item in ipairs(items) do
        if has(item) then
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

-- Can the player attack
function attack()
    return hasAny({ "fsword", "bow", "bombs", "frod", "irod", "hammer", "boots", "nicetrod", "nicehookshot", "superlamp", "supernet" }) or (has("lamp_net_weapons") and hasAny({"lamp", "net"}))
end

-- Same as attack(), minus the bow
function attack_bowproof()
    return hasAny({ "fsword", "bombs", "frod", "irod", "hammer", "boots", "nicetrod", "nicehookshot", "superlamp", "supernet" }) or (has("lamp_net_weapons") and hasAny({"lamp", "net"}))
end

-- Same as attack(), minus the Ice Rod
function attack_iceproof()
    return hasAny({ "fsword", "bow", "bombs", "frod", "hammer", "boots", "nicetrod", "nicehookshot", "superlamp", "supernet" }) or (has("lamp_net_weapons") and hasAny({"lamp", "net"}))
end

-- Return if the player can deal damage to enemies that are immune to fire
function fire_enemy()
    return hasAny({ "fsword", "bow", "bombs", "irod", "hammer", "boots", "nicetrod", "nicehookshot", "supernet" })  or hasAll({ "lamp_net_weapons", "net" })
end

function progression_enemies_floor()
    return hasAny({"bombs", "hammer", "progression_enemies"})
end

-- Return if the player can attack Margomill
-- This is the same as attack(), minus the ice rod
function margomill()
    if hg_big_key() and attack_iceproof() then
        if hg_small_keys(4) then
            return true
        elseif hg_small_keys(2) then
            return true, AccessibilityLevel.SequenceBreak
        end
    end

    return false
end

-- Return if the player can attack Knucklemaster
-- This is the same as attack(), minus the bow
function knucklemaster()
    if has("msword") or (has("swordless") and attack_bowproof()) then
        return true
    elseif attack_bowproof() then
        return true, AccessibilityLevel.SequenceBreak
    end

    return false
end

-- Return if the player can stun enemies
-- Foul Fruit is not considered here as its single-use nature makes it rarely useful
function stun()
    return hasAny({ "boomerang", "hookshot" })
end

-- Has Boomerang, Hookshot, or Fire Rod (used for Hyrule West DM middle level clips/boosts)
function boom_hook_fire()
    return hasAny({ "boomerang", "hookshot", "frod" })
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

function notCracksanity()
    return not has("cracksanity")
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

function bawbs()
    return hasAny({ "progression_enemies", "bombs" })
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

function access_ep_boss()
    return attack() and ep_big_key() and (ep_small_keys(2) or (ep_small_keys(1) and hasAny({ "bombs", "irod" })))
end

function access_ep_boss_glitched()
    if access_ep_boss() then
        return true
    end
    return ep_small_keys(1) and (has("msword") or (hasAll({ "fsword", "great_spin" })))
end

function access_ep_boss_advanced()
    if access_ep_boss_glitched() then
        return true
    end
    return attack() and ep_small_keys(1) and has("trod")
end

-- Can defeat Yuga 1 in Eastern Palace
function yuga_eastern()

    -- Normal
    if access_ep_boss() then
        if has("bow") then
            return true
        end
    end

    -- Hard
    if access_ep_boss() then
        if has("bombs") or hasAny({ "msword", "niceirod" }) or (hasAny({ "boomerang", "hookshot" }) and attack()) then
            return true_for("hard")
        end
    end

    -- Glitched
    if access_ep_boss_glitched() then
        if hasAny({ "bow", "bombs" }) or hasAny({ "msword", "niceirod" }) or (hasAny({ "boomerang", "hookshot" }) and attack()) then
            return true_for("glitched")
        end
    end

    -- Advanced Glitched
    if access_ep_boss_advanced() then
        if hasAny({ "bow", "bombs" }) or hasAny({ "msword", "niceirod" }) or (hasAny({ "boomerang", "hookshot" }) and attack()) then
            return true_for("advanced")
        end

        -- Hell
        if has("irod") then
            return true_for("hell")
        end
    end

    return false
end

function notNiceMode()
    return not has("nice_mode")
end

-- Can use Cracks
-- Not for Hyrule Castle crack (doesn't need Quake)
function crack()
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
    if crack() or (hasAll({ "yuga", "bell", "wv_dark" }) and (has("merge") or dark_palace())) then
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

function dark_palace()
    return hasAll({ "label_power_pd", "power" })
            or hasAll({ "label_wisdom_pd", "wisdom" })
            or hasAll({ "label_courage_pd", "courage" })
            or hasAll({ "label_gulley_pd", "gulley" })
            or hasAll({ "label_oren_pd", "oren" })
            or hasAll({ "label_seres_pd", "seres" })
            or hasAll({ "label_osfala_pd", "osfala" })
            or hasAll({ "label_impa_pd", "impa" })
            or hasAll({ "label_irene_pd", "irene" })
            or hasAll({ "label_rosso_pd", "rosso" })
end

function turtleLake()
    if crack() or hasAll({ "yuga", "bell", "wv_turtle", "flippers" }) then
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
    if hg_small_keys(1) then
        if has("merge") and switch() then
            return true
        elseif hasAny({ "bow", "boomerang", "hookshot", "bombs", "irod", "msword" }) or hasAll({ "great_spin", "fsword" }) then
            return true_for("hard")
        end
    end

    return false
end

-- Can reach House of Gales 3F (assume TRod)
function hog3F()
    if hog2F() and has("merge") then
        if hg_small_keys(3) and fire_enemy() then
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
    return hasAll({"merge"}) and tt_small_key() and thB1B2DoorsOpen() and thDrainWaterB3()
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

function crack_clip()
    return has("boomerang") or hasAll({ "not_nice_mode", "hookshot" }) or shieldRodClip()
end

-- Return if we can get OoB on the south wall of Misery Mire
function advanced_misery_mire_oob()
    if access_misery_mire() then
        if has("nicebombs") then
            return true
        end
        if hasAll({ "irod", "trod", "frod" }) then
            return true
        end
        if hasAll({ "irod", "trod" }) and crack_clip() then
            return true
        end
    end

    if hasAll({ "cracksanity", "frod" }) and hasAny({ "crack_mire_sw", "crack_mire_middle" }) then
        return true
    end
    if hasAll({ "cracksanity" }) and hasAny({ "crack_mire_sw", "crack_mire_middle" }) and crack_clip() then
        return true
    end



    --if (access_misery_mire()
    --        and hasAll({ "irod", "trod" })
    --        or (
    --            has("merge")
    --                    and ((has("cracksanity")
    --                    and hasAny({ "crack_mire_sw", "crack_mire_middle" }))
    --                    or (hasAll({ "not_cracksanity", "quake" })
    --                    and (hasAny({ "srod", "scroll" })
    --                    or boost())))))
    --        and (boost()
    --        or (has("trod")
    --        and crack_clip())) then
    --    return true
    --end

    return false
end

-- Return if we can get OoB on the south wall of Misery Mire
function hell_misery_mire_oob()
    if advanced_misery_mire_oob() then
        return true
    end

    if access_misery_mire() and has("bombs") then
        return true
    end

    if (access_misery_mire() and hasAll({ "irod", "trod" }) or (has("merge") and (hasAll({ "not_cracksanity", "quake" }) or (has("cracksanity") and hasAny({ "crack_mire_sw", "crack_mire_middle" }))))) and (has("frod") or (has("trod") and crack_clip())) then
        return true
    end

    return false
end

-- Return if we have any cracks in Lorule Castle Area, including the Lorule Castle Crack
function access_central_lorule()
    return has("merge") and (hasAny({ "crack_lc", "crack_vacant_house", "crack_thieves_town", "crack_swamp_pillar_lorule", "crack_left_lorule_paradox", "crack_right_lorule_paradox" }) or (warpLorule() and (hasAny({ "wv_vacant_house", "wv_blacksmith", "wv_thieves", "wv_lorule_castle" }) or (has("wv_swamp") and hasAny({ "hookshot", "flippers" })))))
end

function warpLorule()
    return hasAll({ "bell", "merge" }) and ((notCracksanity() and has("quake")) or hasAny({ "crack_hc", "crack_vacant_house", "crack_skull_woods_pillar", "crack_destroyed_house", "crack_lorule_dm_west", "crack_lofi", "crack_rom_lorule", "crack_philosopher", "crack_graveyard_lorule", "crack_waterfall_lorule", "crack_kus_domain", "crack_n-shaped_house", "crack_thieves_town", "crack_dark_ruins_pillar", "crack_dark_ruins_se", "crack_river_lorule", "crack_swamp_pillar_lorule", "crack_lake_lorule", "crack_lorule_hotfoot", "crack_left_lorule_paradox", "crack_right_lorule_paradox", "crack_mire_exit", "crack_mire_north", "crack_mire_pillar_left", "crack_mire_pillar_right", "crack_mire_middle", "crack_mire_sw", "crack_zaganaga", "crack_lc" }))
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
    return hasAll({ "not_cracksanity", "merge", "crack_desert_palace", "quake" })
            or hasAll({ "cracksanity", "merge", "crack_desert_palace" })
end

-- Can players complete Sanctuary
function sanctuary()
    return hs_small_key() and ((has("lamp") and attack()) or hasAll({ "lampless", "frod" }))
end

-- [Lampless] Can players complete Sanctuary
function lampless_sanctuary()
    return hs_small_key() and (has("frod") or sanctuary())
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

-- Return if we can enter Lorule Castle, either with Sages or via the Hyrule Castle Crack
function canEnterLC()
    if lc_requirement() and access_central_lorule() then
        return true
    end

    if notCracksanity() and hasAll({"merge", "crack_hc", "lc_trials_door"}) then
        return true
    end

    if hasAll({ "cracksanity", "crack_lc", "lc_trials_door", "merge" }) then
        return true
    end

    return false
end

-- [Advanced] Return if we can enter Lorule Castle, either with Sages or via the Hyrule Castle Crack
function advanced_canEnterLC()
    if canEnterLC() then
        return true
    end
    if lc_requirement() and advanced_access_central_lorule() then
        return true
    end
    return false
end

-- [Hell] Return if we can enter Lorule Castle, either with Sages or via the Hyrule Castle Crack
function hell_canEnterLC()
    if advanced_canEnterLC() then
        return true
    end
    if lc_requirement() and hell_access_central_lorule() then
        return true
    end
    return false
end



-- Return if we can reach Lorule Castle 2F
function lc2F()
    if attack() then
        return true
    end

    if notCracksanity() and hasAll({"crack_hc", "lc_trials_door"}) then
        return true
    elseif hasAll({"cracksanity", "crack_lc", "lc_trials_door"}) then
        return true
    end

    return true_for("hard")
end

function advanced_lc3F4F()
    if hasAll({"nicebombs", "trod"}) and hasAny({"bow", "merge"}) then
        return true_for("advanced")
    end

    return false
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

-- Returns if we can complete the Lorule Castle Trials normally, without glitches or cracks.
function lc_trials()
    return has("merge") and lc_requirement() and (has("trials_skipped") or hasAll({ "merge", "hookshot", "bombs", "$fire" }))

end

-- Returns only if we can reach the final boss, NOT if we can obtain Zelda's check or win the fight
function can_reach_final_boss()
    if lc_requirement() then
        if has("merge") and (hasAll({"not_cracksanity", "crack_hc"}) or hasAll({"cracksanity", "crack_lc"}))  then
            return true
        end

        if access_central_lorule() and has("lc_trials_door") then
            return true
        end

        if advanced_access_central_lorule() and hasAny({"lc_trials_door", "fsword"}) then
            return true_for("advanced")
        end

        if hell_access_central_lorule() and hasAny({"lc_trials_door", "fsword"}) then
            return true_for("hell")
        end
    end

    return false
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
    return maiamaiUpgradeAvailable() > motherMaiamaiItemsReceived()
end

function motherMaiamaiItemsReceived()
    return count("maiamai_bow") + count("maiamai_boomerang") + count("maiamai_hookshot") + count("maiamai_hammer") + count("maiamai_bombs") + count("maiamai_fire_rod") + count("maiamai_ice_rod") + count("maiamai_tornado_rod") + count("maiamai_sand_rod")
end

function inspect_crack_lorule()
    return has("merge") and (hasAll({ "quake", "not_cracksanity" }) or (hasAll({ "cracksanity", "quake" }))
            or (hasAll({ "crack_hc", "cracksanity" }) and hasNone({ "crack_vacant_house", "crack_skull_woods_pillar", "crack_destroyed_house", "crack_lorule_dm_west", "crack_lofi", "crack_rom_lorule", "crack_philosopher", "crack_graveyard_lorule", "crack_waterfall_lorule", "crack_kus_domain", "crack_n-shaped_house", "crack_thieves_town", "crack_dark_ruins_pillar", "crack_dark_ruins_se", "crack_river_lorule", "crack_swamp_pillar_lorule", "crack_lake_lorule", "crack_lorule_hotfoot", "crack_left_lorule_paradox", "crack_right_lorule_paradox", "crack_mire_exit", "crack_mire_north", "crack_mire_pillar_left", "crack_mire_pillar_right", "crack_mire_middle", "crack_mire_sw", "crack_zaganaga", "crack_lc" })))
end

function inspect_down_crack_lorule()
    return hasAll({ "merge", "quake" })
end

-- Small Keysy
function ep_small_keys(amount) return has("keysy_small") or has_amount("ep_small_keys", tonumber(amount)) end
function hg_small_keys(amount) return has("keysy_small") or has_amount("hg_small_keys", tonumber(amount)) end
function th_small_keys(amount) return has("keysy_small") or has_amount("th_small_keys", tonumber(amount)) end
function hs_small_key() return hasAny({ "keysy_small", "hs_small_key" }) end
function ls_small_key() return hasAny({ "keysy_small", "ls_small_key" }) end
function pd_small_keys(amount) return has("keysy_small") or has_amount("pd_small_keys", tonumber(amount)) end
function sp_small_keys(amount) return has("keysy_small") or has_amount("sp_small_keys", tonumber(amount)) end
function sw_small_keys(amount) return has("keysy_small") or has_amount("sw_small_keys", tonumber(amount)) end
function tt_small_key() return hasAny({ "keysy_small", "tt_small_key" }) end
function tr_small_keys(amount) return has("keysy_small") or has_amount("tr_small_keys", tonumber(amount)) end
function dp_small_keys(amount) return has("keysy_small") or has_amount("dp_small_keys", tonumber(amount)) end
function ir_small_keys(amount) return has("keysy_small") or has_amount("ir_small_keys", tonumber(amount)) end
function lc_small_keys(amount) return has("keysy_small") or has_amount("lc_small_keys", tonumber(amount)) end

-- Big Keysy
function ep_big_key() return hasAny({ "keysy_big", "ep_big_key" }) end
function hg_big_key() return hasAny({ "keysy_big", "hg_big_key" }) end
function th_big_key() return hasAny({ "keysy_big", "th_big_key" }) end
function pd_big_key() return hasAny({ "keysy_big", "pd_big_key" }) end
function sp_big_key() return hasAny({ "keysy_big", "sp_big_key" }) end
function sw_big_key() return hasAny({ "keysy_big", "sw_big_key" }) end
function tt_big_key() return hasAny({ "keysy_big", "tt_big_key" }) end
function tr_big_key() return hasAny({ "keysy_big", "tr_big_key" }) end
function dp_big_key() return hasAny({ "keysy_big", "dp_big_key" }) end
function ir_big_key() return hasAny({ "keysy_big", "ir_big_key" }) end
