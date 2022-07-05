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

-- Glitch Logic
-- Always returns true, but if glitch_logic is enabled checks will show as green instead of yellow
function glitch()
    if has("glitch_logic") then
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
        if (has("hard")) then
            return true
        else
            return true, AccessibilityLevel.SequenceBreak
        end
    end

    return false
end

-- Return if the player can attack Margomill
-- This is the same as attack(), minus the ice rod
function margomill()
    if hasAny({ "fsword", "bow", "bombs", "frod", "hammer", "boots" }) then
        return true
    elseif hasAny({ "lamp", "net" }) then
        if (has("hard")) then
            return true
        else
            return true, AccessibilityLevel.SequenceBreak
        end
    end

    return false
end

-- Return if the player can attack Knucklemaster
-- This is the same as attack(), minus the bow rod
function knucklemaster()
    if hasAny({ "fsword", "bombs", "frod", "irod", "hammer", "boots" }) then
        return true
    elseif hasAny({ "lamp", "net" }) then
        if (has("hard")) then
            return true
        else
            return true, AccessibilityLevel.SequenceBreak
        end
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
-- Having Bell would be ideal, but death warping using bombs or fire rod also works
-- If we can't escape, still return true, but with access level Inspect b/c the player can technically die to view it
function escape()
    return hasAny({ "bell", "bombs", "frod" })
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
    return hasAny({ "lamp", "lampless" })
end

-- Return if we can get OoB on the south wall of Misery Mire
function miseryMireOoB()
    return has("merge") and (boost() or portalClip())
end

-- Return if Portal Clipping is enabled and we can perform it
function portalClip()
    return has("trod") and (hasAny({ "boomerang", "hookshot" }) or shieldRodClip())
end

-- Bee Boosting
-- This is a hard opt-in trick, and it can't be done if the player has the Bee Badge
function beeBoost()
    return not has("beebadge")
end

function cutGrass()
    return hasAny({ "fsword", "boomerang", "bombs", "frod", "irod", "lamp", "boots" });
end
