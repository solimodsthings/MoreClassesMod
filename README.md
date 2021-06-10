![](https://i.imgur.com/Z3mHRQO.png)

# Overview
This is a mod for [Himeko Sutori](https://himekosutori.com/) that adds new unlockable character classes and class abilities to the base game. It is built using the game’s new mutator loader and does not make modifications to base content files. 

The mod is designed to work with existing save files. Create a backup of your save file if you choose to use this mod in the middle of an existing campaign. 

More Classes Mod depends on another Himeko Sutori mod, [Events Mod](https://github.com/solimodsthings/EventsMod).

# Classes 

<b>Added as of v0.1</b>
- Moon Sage
- Tactician
- Mercenary
- Bishop

([Check out the full class descriptions here](https://github.com/solimodsthings/MoreClassesMod/wiki).)

<b>Planned for Next Release</b>
- Luminary

# Mod Dependencies and Compatiblity
This mod relies on Events Mod and is compatible with other mods that use Events Mod. Please ensure Events Mod is loaded before this mod. See installation steps further below.
Because this mod uses Events Mod, it is not compatible with other mods that replace the game’s player controller. 

# How do I install this mod?
1.  [Download the mod files from the releases page](https://github.com/solimodsthings/MoreClassesMod/releases) to your PC
1.	Open your Himeko Sutori steam folder by right-clicking on the game in Steam and choosing Manage > Browser Local Files.
2.	Place files <i>EventsMod.u</i> and <i>MoreClassesMod.u</i> in folder <b>…/Himeko Sutori/RPGTacGame/Script/</b>
3.	Place file <i>MoreClassesModContent.upk</i> in folder <b>…/Himeko Sutori/RPGTacGame/Content/</b>
4.	Place file <i>MoreClassesModContent.int</i> in folder <b>…/Himeko Sutori/RPGTacGame/Localization/INT/</b>
5.	Update file <b>…/Himeko Sutori/RPGTacGame/Config/RPGTacMods.ini</b> so the mod is loaded whenever you start the game – the file should look like this:

```
[rpgtacgame.RPGTacMutatorLoader]
MutatorsLoaded=EventsMod.EventsModStart,MoreClassesMod.MoreClassesModStart
```

(Note: Make sure there are no spaces in the mod list as whitespaces don’t get trimmed!)

# What exactly am I installing?
- [EventsMod.u](https://github.com/solimodsthings/EventsMod) – this is a utility mod that replaces the game’s base PlayerController class with an identical one that is observable. The observable PlayerController generates events that other mods can listen to. This mod does not add content, but is a requirement for More Classes Mod to work.
- MoreClassesMod.u – this contains logic that unlocks classes for characters that meet the requirements. It is also in charge of ensuring that new classes can equip weapons and armor from the base game properly.
- MoreClassesModContent.upk – this is where new classes, abilities, cards, and status effects are defined. 
- MoreClassesModContent.int – this is where the names and descriptions of classes, abilities, etc. are defined.

# Special Thanks
Special thanks to Nathaniel who took time to help me understand how UDK and modding works in his game!
