-- Returns true if the player has the given item or setting
function has(item)
    return Tracker:ProviderCountForCode(item) == 1
end

-- Returns true if the player can use any of the given items
function hasAny(items)
    for _, item in ipairs(items) do
        if has(item) then
            return true;
        end
    end
    return false;
end

-- Returns true if the player can use ALL of the given items
function hasAll(items)
    for _, item in ipairs(items) do
        if not has(item) then
            return false;
        end
    end
    return true;
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
    return hasAny({ "boomerang", "hookshot", "srod" })
end

-- Return if the player can Fire Rod Boost or Lemon Boost to small ledges
-- Regular Bomb Boosting is not considered unless the player enables the option
-- Bee Boosting is also considered if enabled and the player doesn't have the Bee Badge
function boost()
    return hasAny({ "frod", "nicebombs" })
end

-- Return if the player can perform Fake Flippers
-- Regular Bomb Boosting is not considered unless the player enables the option
function fakeFlippers()
    return has("boots") and boost()
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

-- Bee Boosting
-- This is a hard opt-in trick, and it can't be done if the player has the Bee Badge
function beeBoost()
    return hasAny({ "beeBoost_show", "hell" }) and not has("beebadge");
end

function cutGrass()
    return hasAny({ "fsword", "boomerang", "bombs", "frod", "irod", "lamp", "boots" });
end

-- Can defeat Yuga 1 in Eastern Palace
function yuga1()
    if has("bow") then
        return true
    elseif has("bombs") or (hasAny({ "boomerang", "hookshot" }) and attack()) then
        return true_for("hard")
    elseif hasAny({ "irod", "msword" }) then
        return true_for("hell")
    else
        return false
    end
end

-- Can reach House of Gales 2F (assume TRod)
function hog2F()
    if has("merge") and switch() then
        return true
    elseif hasAny({ "bow", "boomerang", "hookshot", "bombs", "irod", "msword" }) then
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
            return true_for("basic")
        end
    else
        return false
    end
end

-- Can reach Thieves' Hideout B2
function thB2()
    if has("merge") and switch() then
        return true
    elseif has("boots") and hasAny({ "boomerang", "irod" }) then
        return true_for("basic")
    elseif hasAny({ "boomerang", "irod" }) then
        return true_for("advanced")
    elseif has("bombs") then
        return true_for("hell")
    else
        return false
    end
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

-- Return if we can reach Desert Palace 2F
function dp2F()
    return hasAll({ "merge", "srod", "titansmitt" }) and switch() and attack()
end

-- Return if we can get OoB on the south wall of Misery Mire
function miseryMireOoB()
    if has("merge") and boost() then
        return true_for("advanced")
    elseif has("trod") and (hasAny({ "boomerang", "hookshot" }) or shieldRodClip()) then
        return true_for("hell")
    else
        return false
    end
end

-- Return if we can perform Reverse Desert Palace
function reverseDP()
    if has("srod") and miseryMireOoB() then
        return true_for("advanced")
    else
        return false
    end
end

-- Return if we can enter Turtle Rock
function enterTR()
    if hasAll({ "merge", "irod" }) then
        if has("flippers") then
            return true
        elseif fakeFlippers() then
            return true_for("advanced")
        elseif has("boots") then
            return true_for("hell")
        end
    end

    return false
end

function hc_barrier()
    if has("msword") then
        return true
    elseif hasAll({ "merge", "boots", "trod", "bombs" })
            and hasAny({ "hookshot", "boomerang" })
            and not lc_requirement() then
        return true, AccessibilityLevel.SequenceBreak -- barrier skip, not in any logic because it's missable
    else
        return false
    end
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
    return has("merge") and (lc_requirement() or (hc_barrier() and has("yuga")))
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

    local requirement
    if has("yg_requirement_7") then
        requirement = 7
    elseif has("yg_requirement_6") then
        requirement = 6
    elseif has("yg_requirement_5") then
        requirement = 5
    elseif has("yg_requirement_4") then
        requirement = 4
    elseif has("yg_requirement_3") then
        requirement = 3
    elseif has("yg_requirement_2") then
        requirement = 2
    elseif has("yg_requirement_1") then
        requirement = 1
    else
        requirement = 0
    end

    return count("sage") >= requirement
end

-- Returns only if we can reach the final boss, NOT if we can obtain Zelda's check or win the fight
function can_reach_final_boss()
    return has("merge") and yg_requirement() and (
            (has("yuga") and has_amount("courage", 2)) or (
                    lc_requirement() and (
                            has("trials_skipped") or hasAll({ "merge", "hookshot" })
                    )
            )
    )
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
    return count("nicebow") +
            count("niceboomerang") +
            count("nicehookshot") +
            count("nicehammer") +
            count("nicebombs") +
            count("nicefrod") +
            count("niceirod") +
            count("nicetrod") +
            count("nicesrod")
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