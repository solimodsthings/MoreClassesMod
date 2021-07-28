![](https://i.imgur.com/Z3mHRQO.png)

# Overview
This is a mod for [Himeko Sutori](https://himekosutori.com/) that adds new unlockable character classes and class abilities to the base game. It is built using the game’s new mutator loader and does not make modifications to base content files. 

The mod is designed to work with existing save files. Create a backup of your save file if you choose to use this mod in the middle of an existing campaign. 

More Classes Mod depends on another Himeko Sutori mod, [CoreMod](https://github.com/solimodsthings/CoreMod).

# Classes 

<b>Currently added by this mod:</b>
- [Moon Sage](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Mages
- [Strategist](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Students
- [Mercenary](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Adventurers
- [Bishop](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Clerics
- [Luminary](https://github.com/solimodsthings/MoreClassesMod/wiki), an advanced class for characters that have cross-trained Knight and Mage
- [Guardian](https://github.com/solimodsthings/MoreClassesMod/wiki), a class specializing in lance defense and countering Illusionist debuffs
- [Peacekeeper](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization of Gunners that use conjured ammunition and artillery magic
- [Mudbastion](https://github.com/solimodsthings/MoreClassesMod/wiki), a tanky specialization for Slimes 
- [Sludgelord](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Slimes that has access to a ranged attack

<b>Planned for release v0.4</b>
- [Ironfey](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Faeries
- [Sylph](https://github.com/solimodsthings/MoreClassesMod/wiki), a specialization for Faeries

<b>Planned for release v0.5</b>
- [Gladiator](https://github.com/solimodsthings/MoreClassesMod/wiki), an advanced class for Warriors and unlocked after completing question "The Gladiator"

# Mod Dependencies and Compatiblity
This mod relies on CoreMod and is compatible with other mods that use CoreMod. Please ensure CoreMod is loaded before this mod. See installation steps further below.

# How do I install this mod?
1.  [Download the mod files from the releases page](https://github.com/solimodsthings/MoreClassesMod/releases) to your PC
1.	Open your Himeko Sutori steam folder by right-clicking on the game in Steam and choosing Manage > Browser Local Files.
2.	Place files <i>CoreMod.u</i> and <i>MoreClassesMod.u</i> in folder <b>…/Himeko Sutori/RPGTacGame/Script/</b>
3.	Place file <i>MoreClassesModContent.upk</i> in folder <b>…/Himeko Sutori/RPGTacGame/Content/</b>
4.	Place file <i>MoreClassesModContent.int</i> in folder <b>…/Himeko Sutori/RPGTacGame/Localization/INT/</b>
5.	Update file <b>…/Himeko Sutori/RPGTacGame/Config/RPGTacMods.ini</b> so the mod is loaded whenever you start the game – the file should look like this:

```
[rpgtacgame.RPGTacMutatorLoader]
MutatorsLoaded=CoreMod.CoreStart,MoreClassesMod.MoreClassesModStart
```

(Note: Make sure there are no spaces in the mod list as whitespaces don’t get trimmed!)

# What exactly am I installing?
- [CoreMod.u](https://github.com/solimodsthings/CoreMod) – this is a dependency that allows this the More Classes Mod to listen on game events (eg. characters levelling up) and be compatible with other mods
- MoreClassesMod.u – this handles unlocking classes for characters that meet requirements, ensuring new classes can equip weapons and armor from the base game properly, and adding new recipes to base game shopkeeper inventories
- MoreClassesModContent.upk – this is where the definitions of classes, abilities, cards, and status effects live
- MoreClassesModContent.int – this is where the names and descriptions of classes, abilities, etc. live

# Special Thanks
Special thanks to Nathaniel who took time to help me understand how UDK and modding works in his game!
