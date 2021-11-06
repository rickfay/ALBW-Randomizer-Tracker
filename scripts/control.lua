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

-- Y Button needs to be unlocked to use items
-- This is normally tied to the Lamp, although a popular option is to enable it by default
function yButton()
    return hasAny({ "yButton", "lamp" })
end

-- Return if the player can deal damage
-- Player options are provided to consider lamp, net, and boots as viable damage sources (flagged as Seq Breaks)
function attack()
    local yButton = yButton()
    if has("fsword") or (yButton and hasAny({ "bow", "bombs", "frod", "irod", "hammer" })) then
        return true
    elseif hasAll({ "lamp", "lampAsWeapon" })
            or (yButton and hasAll({ "net", "netAsWeapon" }))
            or hasAll({ "boots", "bootsAsWeapon" }) then
        return true, AccessibilityLevel.SequenceBreak
    else
        return false
    end
end

-- Return if the player can attack Margomill
-- This is the same as attack(), minus the ice rod
function margomill()
    local yButton = yButton()
    if has("fsword") or (yButton and hasAny({ "bow", "bombs", "frod", "hammer" })) then
        return true
    elseif hasAll({ "lamp", "lampAsWeapon" })
            or (yButton and hasAll({ "net", "netAsWeapon" }))
            or hasAll({ "boots", "bootsAsWeapon" }) then
        return true, AccessibilityLevel.SequenceBreak
    else
        return false
    end
end

-- Return if the player can stun enemies
-- Foul Fruit is not considered here as its single-use nature makes it rarely useful
function stun()
    return yButton() and hasAny({ "boomerang", "hookshot", "srod" })
end

-- Return if the player can Fire Rod Boost or Lemon Boost to small ledges
-- Regular Bomb Boosting is not considered unless the player enables the option
function boost()
    return yButton() and (hasAny({ "frod", "nicebombs" })
            or hasAll({ "bombs", "bombBoost" })), AccessibilityLevel.SequenceBreak
end

-- Return if the player can perform Fake Flippers
-- Regular Bomb Boosting is not considered unless the player enables the option
function fakeFlippers()
    return has("boots") and boost(), AccessibilityLevel.SequenceBreak
end

-- Return if the player can perform a Shield Rod Clip
-- This must be enabled in options to be considered
function shieldRodClip()
    return yButton() and hasAll({ "trod", "shield", "shieldRodClip" }), AccessibilityLevel.SequenceBreak
end

-- Return if the player is able to escape an otherwise softlock-able area
-- Having Bell would be ideal, but death warping using bombs or fire rod also works
-- If we can't escape, still return true, but with access level Inspect b/c the player can technically die to view it
function escape()
    if (has("bell") or (yButton() and hasAny({ "bombs", "frod" }))) then
        return true, AccessibilityLevel.SequenceBreak
    else
        return true, AccessibilityLevel.Inspect
    end
end

-- Return if Link has a Fire source
-- This is mostly for checking if Link can light torches
function fire()
    return has("lamp") or hasAll({ "yButton", "frod" })
end

-- Return if Link can hit Crystal Switches
-- Pots aren't accounted for here, but may make hitting some switches possible
function switch()
    return has("fsword") or (yButton() and hasAny({ "bow", "boomerang", "hookshot", "bombs", "irod", "hammer", "boots" }))
end

-- Return if Link either has lamp, or lampless is enabled
function lampless()
    if has("lamp") then
        return true
    elseif has("lampless") then
        return true, AccessibilityLevel.SequenceBreak
    else
        return false
    end
end

-- Return if the Captain's Forgotten Sword cannot be skipped (annoying work-around)
function dontSkipDelivery()
    return not has("skipDelivery")
end

-- Return if the Eastern Palace is NOT complete, meaning the Barrier isn't up (standard mode)
function notEastern()
    return not has("eastern")
end

-- Return if we can get OoB on the south wall of Misery Mire
function miseryMireOoB()
    return hasAll({ "lorule", "merge" }) and (boost() or portalClip()), AccessibilityLevel.SequenceBreak
end

-- Return if Portal Clipping is enabled and we can perform it
function portalClip()
    return hasAll({ "portalClipping", "trod" }) and (hasAny({ "boomerang", "hookshot" }) or shieldRodClip()), AccessibilityLevel.SequenceBreak
end

-- Return if we can get Out of Bounds in Thieves
-- Hammer, Hookshot, Sword Slashes, Boots, and all the optional weapons don't give you enough time to perform the clip
function thievesOoB()
    return yButton() and hasAny({ "msword", "bow", "boomerang", "bombs", "irod" }), AccessibilityLevel.SequenceBreak
end