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

-- Returns true if the player has at least a given amount of an item or setting
function has_amount(item, amount)
    return Tracker:ProviderCountForCode(item) >= amount
end

-- Returns true if we're using the specified logic, or (true, SequenceBreak) if not
function logic(logic)
    if has(logic) then
        return true
    else
        return true, AccessibilityLevel.SequenceBreak
    end
end

-- Return if the player can deal damage
function attack()
    if hasAny({ "fsword", "bow", "bombs", "frod", "irod", "hammer", "boots" }) then
        return true
    elseif hasAny({ "lamp", "net" }) then
        return logic("hard")
    else
        return false
    end
end

-- Return if the player can deal damage to enemies that are immune to fire
function fire_enemy()
    if hasAny({ "fsword", "bow", "bombs", "irod", "hammer", "boots" }) then
        return true
    elseif has("net") then
        return logic("hard")
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
        return logic("hard")
    end

    return false
end

-- Return if the player can attack Knucklemaster
-- This is the same as attack(), minus the bow
function knucklemaster()
    if hasAny({ "fsword", "bombs", "frod", "irod", "hammer", "boots" }) then
        return true
    elseif hasAny({ "lamp", "net" }) then
        return logic("hard")
    end

    return false
end

function yuga2()
    return hasAny({ "fsword", "bombs", "frod", "irod", "hammer" })
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
        return logic("lampless") -- hacky but w/e
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

function has_all_sages()
    return has_amount("sage", 7);
end

function does_not_have_all_sages()
    return not has_all_sages();
end

-- Can defeat Yuga 1 in Eastern Palace
function yuga1()
    if hasAny({ "bow", "bombs" }) or hasAny({ "boomerang", "hookshot" }) then
        return attack()
    elseif hasAny({ "irod", "msword" }) then
        return logic("hell")
    else
        return false
    end
end

-- Can reach House of Gales 2F (assume TRod)
function hog2F()
    if has("merge") and switch() then
        return true
    elseif hasAny({ "bow", "boomerang", "hookshot", "bombs", "irod", "msword" }) then
        return logic("hard")
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
            return logic("basic")
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
        return logic("basic")
    elseif hasAny({ "boomerang", "irod" }) then
        return logic("advanced")
    elseif has("bombs") then
        return logic("hell")
    else
        return false
    end
end

-- Can reach the Thieves' Hideout Escape
function thEscape()
    if hasAll({ "merge", "flippers" }) and attack() then
        return true
    elseif has("trod") and hasAny({ "bombs", "irod" }) then
        return logic("advanced")
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
        return logic("advanced")
    elseif has("trod") and (hasAny({ "boomerang", "hookshot" }) or shieldRodClip()) then
        return logic("hell")
    else
        return false
    end
end

-- Return if we can perform Reverse Desert Palace
function reverseDP()
    if has("srod") and miseryMireOoB() then
        return logic("advanced")
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
            return logic("advanced")
        elseif has("boots") then
            return logic("hell")
        end
    end

    return false
end

-- Return if we can reach Lorule Castle 2F
function lc2F()
    if attack() then
        return true
    else
        return logic("hard")
    end
end