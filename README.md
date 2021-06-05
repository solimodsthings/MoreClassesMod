![](https://i.imgur.com/Z3mHRQO.png)

# Overview
This is a mod for [Himeko Sutori](https://himekosutori.com/) that adds new unlockable character classes abilities to the base game. It is built using the game’s new mutator loader and does not make modifications to base content files. 

The mod is designed to work with existing save files. Create a backup of your save file if you choose to use this mod in the middle of an existing campaign. 

# New Classes Added

<h2>Moon Sage</h2>
<table>
  <tr>
    <td>Description</td>
    <td>
      There are several distinct orders of mages in the world. Moon Sages are such an order known for worshipping a goddess of the night sky. It is not known whether this order legitimately derives power from the moon, but their ability to conceal the movements of allies in combat is unquestionably valuable.
    </td>
  </tr>
  <tr>
    <td>Available Abilities</td>
    <td>
      <ul>
        <li>Lunar Blast (default)</li>
        <li>Void Sky (reaction, inflicts new debuff Voidshock)</li>
        <li>Concealing Darkness (reaction, grants new buff Concealed)</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Unlock Requirement</td>
    <td>
      Any Mage that levels up at night time will unlock this hidden class.
    </td>
  </tr>
</table>

<h2>Bishop</h2>
<table>
  <tr>
    <td>Description</td>
    <td>
      The most experienced and battle-hardened of Clerics are eventually ordained to become Bishops.
    </td>
  </tr>
  <tr>
    <td>Available Abilities</td>
    <td>
      <ul>
        <li>Radiant Light (default)</li>
        <li>Salvation (reaction)</li>
        <li>Empowering Faith (passive)</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Unlock Requirement</td>
    <td>
      Unlock the Cleric class and acquire the Bishop card from the Cleric deck. If you have characters that have Cleric already unlocked, the Bishop card can appear as received. This mod will automatically unlock the Bishop class for any characters where this is the case.
    </td>
  </tr>
</table>

<h2>Scholar</h2>
<table>
  <tr>
    <td>Description</td>
    <td>
      Most Students eventually become Clerics or Druids, but a few will choose a life devoted to scholarly research and the pursuit of knowledge as Scholars. In addition to healing allies, Scholars use their extensive knowledge in history and military strategy to buff allies and debuff enemies.
    </td>
  </tr>
  <tr>
    <td>Available Abilities</td>
    <td>
      <ul>
        <li>Greater Salve (default)</li>
        <li>Examine Weakness (reaction, inflicts new debuff Examined)</li>
        <li>Strategic Insights (reaction, grants new buff Advised)</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Unlock Requirement</td>
    <td>
      Any character that masters the Student class unlocks this hidden class.
    </td>
  </tr>
</table>

<h2>Mercenary</h2>
<table>
  <tr>
    <td>Description</td>
    <td>
      Adventurers who enjoy front-line fighting will sometimes go on to make a name for themselves as Mercenaries for hire. The only thing better than seeking a life of adventure is getting paid to seek a life of adventure.
    </td>
  </tr>
  <tr>
    <td>Available Abilities</td>
    <td>
      <ul>
        <li>Bold Strike (default)</li>
        <li>Fortify (reaction, grants new buff Fortified)</li>
        <li>Veteran Tactics (passive)</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>Unlock Requirement</td>
    <td>
      Any character that masters the Adventurer class unlocks this hidden class.
    </td>
  </tr>
</table>

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
- EventsMod.u – this is a utility mod that replaces the game’s base PlayerController class with an identical one that is observable. The observable PlayerController generates events that other mods can listen to. This mod does not add content, but is a requirement for More Classes Mod to work.
- MoreClassesMod.u – this contains logic that unlocks classes for characters that meet the requirements. It is also in charge of ensuring that new classes can equip weapons and armor from the base game properly.
- MoreClassesModContent.upk – this is where new classes, abilities, cards, and status effects are defined. 
- MoreClassesModContent.int – this is where the names and descriptions of classes, abilities, etc. are defined.

# Special Thanks
Special thanks to Nathaniel who took time to help me understand how UDK and modding works in his game!
