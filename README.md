# Z17 Randomizer Tracker

## About

This is an [EmoTracker](https://emotracker.net/) pack for tracking progress in The Legend of Zelda: A Link Between Worlds Randomizer.

## Release Notes

- Author: LemonKong
- Version:
    - 2.0.0:
        - Updated to support the new Z17 Randomizer
        - Layout Changes:
            - Removed Ravio/Signs, Shady Guy, and both Triforces
            - Moved Bracelet, Smooth Gem, and Bow of Light to new spots
            - Design tweaked to accommodate changes
        - Logic Updates:
            - Ravio's Shop is open by default
            - Shady Guy Trigger is triggered by default
            - Portals to Lorule are open by default
            - Bombs are no longer required to collect Maiamai
                - New Logic added for cases when you do not have Bombs
            - Lorule Blacksmith now requires Hyrule Blacksmith check cleared first
            - Shady Guy check can be obtained with Pegasus Boots
            - Fix errors in Bee Boost logic I doubt anyone noticed
        - Remove several legacy game options no longer relevant to the randomizer
    - 1.1.3:
        - Fix Cucco Minigame check to no longer require Ravio's shop
        - UI Changes:
            - Split several overworld checks with multiple sub-checks into separate checks.
                - This may change in the future based on feedback.
            - Dungeon Rewards have slightly larger icons on the maps now
                - These will now show as Blue if the dungeon can be entered (beyond the lobby)
        - Change to "Crossing Dark Room Lampless" logic:
            - All checks in dark rooms now show as Yellow without Lamp by default
            - Enabling "Cross Dark Rooms Lampless" will now switch those checks to Green
        - Lorule Castle logic has been expanded:
            - Go Mode items aren't explicitly required anymore if you have the Sages or ToC
            - Remember you need Sword (or Net with "Net as a Weapon" enabled) to play Tennis with Yuganon
    - 1.1.2:
        - Add sequence breaks to get Eastern Ruins Pegs check with an Enemy Clip from a Tektite
    - 1.1.1:
        - Change Pendant of Courage to a progressive item with the Charm as its first stage to alleviate confusion for people playing on Standard Mode.
        - Add new Modify Glitch Logic option "Use Crows to Escape Locations"
        - Expand Bee Boost logic into all ledge boosting locations, but only if player doesn't have Bee Badge
        - Shield Rod Clipping now requires sword
        - Fix Desert Maiamai showing as obtainable before having Merge and access to Lorule
    - 1.1.0:
        - UI Changes:
            - Add a purple outline around the Lorule icon to make it easier to see when it's been obtained
            - Split Options Menu into two sections: "Game Options" and "Modify Glitch Logic" for ease of use
            - Remove custom rental images in Ravio's Shop to reduce visual clutter (Sold Out signs are still kept)
            - Change Side-By-Side tab icon
            - Rename a few checks for clarity
        - Logic Adjustments:
            - Add sequence breaks for Dash Dungeon with Nice Bow or Nice Ice Rod
            - Add sequence breaks to get past the Pegs north of Kakariko using the Hookshot or an enemy clip
            - Add new Modify Glitch Logic option "Vulture Boosting"
        - Overload item codes with many human-friendly options for use with EmoTracker's ChatHUD system
        - Made some revisions to the README
    - 1.0.3:
        - Add sequence break for Dash Dungeon with Sword Beams
    - 1.0.2:
        - Add logic to consider new Dash Dungeon strategies with just Bombs or Boomerang
        - Remove Dropshadow from broadcast tracker icons
        - Adjust floor icons in Swamp and Lorule Castle
        - Rearrange directory structure slightly to ease building dev artifacts
    - 1.0.1:
        - Removed explicit background color from broadcast view.
    - 1.0.0:
        - Official release. Updated README.
    - 0.0.1:
        - Initial Beta release. Moved to new repo.

## Features

- **Dungeon Tracker:** Maps for every dungeon, with full logic tracking! Check out the locations and accessibility of
  chests, small keys, heart containers, and dungeon rewards at a glance. A multi-tabbed, flexible layout is provided,
  one that can neatly accommodate even Tower of Hera's massive thirteen floors!


- **Maiamai Map**: Click the Maiamai Map icon to be shown all Maiamai currently in logic! All 100 Maiamai are present,
  displayed as smaller squares than normal checks. The Maiamai Map icon can be toggled on/off to show/hide the Maiamai
  as desired.
    - NOTE: Bombs are required to open Mother Maiamai's Cave, meaning they are required to obtain/see every single
      Maiamai.


- **HD Overworld Maps:** 2048x2048 maps supplied for tracking the Hyrule and Lorule Overworlds in great
  detail! Two options are provided to give you more viewing control:
    - The "Side-by-Side" view shows Hyrule and Lorule together so you can see everything at once.
    - The "Zoomed" view provides a close-up look at both maps, making it easier to focus on a specific area.


- **ALttP Inspired Compact Menu Layout**: Given this is the sequel to one of the most famous games to
  receive a randomizer, I really wanted this tracker to pay homage to ALttP with its item layout. The layout tries to
  copy the Start Menu of ALttP using its sequel's items, with minimal substitutions, while also making room for this
  game's new additions. The entire layout is kept compact, with all items fitting neatly inside a 6x8 grid.


- **Options Menu**: Several difficult tricks are not considered in logic by default, but can easily be toggled on/off. Currently available
  options include:

    - Modify Glitch Logic:
        - Cross Dark Rooms Lampless
        - Lamp as a Weapon
        - Net as a Weapon
        - Pegasus Boots as a Weapon
        - Regular Bomb Boosting
        - Shield Rod Clipping
        - Bee Boosting
        - Portal Clipping
        - Zaganaga with Bow
        - Zaganaga with Sword Beams
        - Vulture Boosting


- **Item-Only Mode:** Disable maps and show only the compact item tracker.
    - Broadcast Mode will similarly show only the compact item tracker.


- **Pinned Locations**: Pin any location to the side bar for later! Scroll bar support added for those who like to pin
  all the things.


- **Capture Item Support**: Take notes! The tracker supports recording the contents of all dungeon chests and
  freestanding items. These may be set to many of the standard items on the tracker, as well as several "trash" items (rupees, heart pieces, monster guts, etc.).
    - Integrates with EmoTracker's Global Notes system

## FAQ

- **I can't see any Maiamai?**
    - Click the golden Maiamai Map icon in the upper left part of the overworld map.


- **There are too many Maiamai!**
    - Click the Maiamai Map icon again to hide all the Maiamai checks.


- **What's the star next to the Master Sword?**
    - That's the Great Spin you uncultured swine.


- **You labelled the 6F in Lorule Castle incorrectly!!**
    - You sure about that?


- **Why did you make this?**
    - Why does anyone make anything?


- **I found a problem with the logic!**
    - Probably. There's an awful lot of combinations, I likely missed a few. Please send me a polite message
      explaining the behavior you're seeing, with a screenshot (if possible) should the logic be particularly complex.
      Please also include which options you currently have enabled/disabled.

## Planned Features

- Adjustments to keep the tracker in line with future Randomizer updates and modes
- Higher quality dungeon map pictures
- Limited Key information in dungeons (under consideration)
- Simplify logic choices to match settings for the Z17 Randomizer