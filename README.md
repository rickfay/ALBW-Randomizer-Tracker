# ALBW Randomizer Tracker

## About

This is an [EmoTracker](https://emotracker.net/) pack for tracking progress in The Legend of Zelda: A Link Between Worlds Randomizer.

## Release Notes

- Author: LemonKong
- Version:
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

## Screen Shots

![screenshot_01.png](screenshots/screenshot_01.png?raw=true)
![screenshot_02.png](screenshots/screenshot_02.png?raw=true)
![screenshot_03.png](screenshots/screenshot_03.png?raw=true)
![screenshot_04.png](screenshots/screenshot_04.png?raw=true)


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


- **Options Menu**: The tracker supports Standard + Open modes, but will default to the popular Open Mode settings. You
  can tweak these as you like in the Options Menu; presets are a planned feature for a future update. Also, several
  difficult tricks are not considered in logic by default, but can be enabled from this same menu. Currently available
  options include:
  
    - Game Options:
        - Use Items without Lamp
        - Skip Captain's Sword Delivery
        - Skip Sanctuary ("Open" Mode)
        - Barrier Up before Eastern Palace
        - Shuffle the Sword
        - Shuffle the Lamp
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


- **What do the Triforces mean?**
    - Lorule's Triforce ![Lorule's Triforce](images/loforce.png) represents gaining access to Lorule, and is the
      prize for defeating Yuga 2 in Hyrule Castle. It is a prerequisite for every single check in Lorule, along with
      Ravio's Bracelet. As this item would otherwise be completely black, a purple outline has been added to make it easier to see when it has been collected.
    - The Triforce of Courage ![Triforce of Courage](images/triforce_courage.png) is largely decorative; you can ignore it, and the tracker will work just fine. It's there
      for those who want to record when they collect it, or not record it to signify it's been skipped. Clicking it a
      second time will upgrade it to the full Triforce, to show that the game has been completed.
        - Lorule Castle's logic will accept the Triforce of Courage in place of the seven Sages, if for some reason you
          don't feel like clicking them all.


- **What's the ![Bomb Flower](images/bomb_flower.png?raw=true) for?**
    - Purchase the Big Bomb Flower at the Bomb Flower Store to unlock this. The Big Bomb Flower can be used to blow up huge
      rocks blocking several other checks, and in a pinch it can be used in place of the usual bombs to blast open the
      Vacant House.


- **What's the ![blonde haired guy](images/shady_guy.png?raw=true) for?**
    - That's the Shady Guy, you run into him when first approaching Zora's Domain. That short cutscene is a trigger that
      activates two checks in Kakariko Village: one for buying the item in the Smooth Gem Slot from the Street Merchant,
      and one for sneaking up on the Shady Guy himself to get an item.


- **What's the ![purple sign](images/signs.png?raw=true) / ![purple sign](images/ravio.png?raw=true) for?**
    - The Ravio Sign represents a trigger you can activate by watching a short cutscene near Eastern Palace. This
      trigger will cause Ravio to give you the item in the Bow slot for free the next time you enter his shop. This
      trigger is superseded by the triggers that unlock Ravio's full shop, and so activating any of them will "upgrade"
      the Sign on the tracker to Ravio, indicating the shop is fully open.


- **Why isn't the trigger for Ravio's Signs available?**
    - On Standard Mode, the signs won't appear until you go through the game's prologue story triggers. After completing
      the Sanctuary, you need to go to Zelda to get the Special Charm, and then Sahasrahla's House to have him mark your
      map with an X.
        - I've chosen not to include checks on the map for the Special Charm and Sahasrahla. If this becomes a problem
          or creates confusion, I will add them.


- **What's the trigger to activate Hyrule Hotfoot?**
    - Any of the Irene triggers.


- **What's the star next to the Master Sword?**
    - That's the Great Spin you uncultured swine.


- **I can't see any Maiamai?**
    - In addition to clicking the golden Maiamai Map icon, you must also have Bombs to see any Maiamai. This is because
      Bombs are needed to open Mother Maiamai's Cave, and so are required for every single Maiamai.


- **There are too many Maiamai!**
    - Click the Maiamai Map icon again to hide all the Maiamai checks.


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
- Presets for settings
- Limited Key information in dungeons (under consideration)
- Considering more logic options to accommodate the many obscure ways to skip Desert Palace