// [More Classes Mod for Himeko Sutori (2021)]

class ContentModifier extends EventListener
    placeable;

// Part of original game
var RPGTacCharacterClass StudentClass;
var RPGTacCharacterClass AdventurerClass;
var RPGTacCharacterClass WarriorClass;
var RPGTacCharacterClass ClericClass;
var RPGTacCharacterClass CadetClass;
var RPGTacCharacterClass MageClass;
var RPGTacCharacterClass KnightClass;

// Classes added by mod
var RPGTacCharacterClass BishopClass;
var RPGTacCharacterClass ScholarClass;
var RPGTacCharacterClass MercenaryClass;
var RPGTacCharacterClass MoonSageClass;
var RPGTacCharacterClass LuminaryClass;

// Level up cards added by mod
var RPGTacCharacterClass_LevelUpCard BishopCard;

DefaultProperties
{
    // Part of original game
    StudentClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Student'
    AdventurerClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Adventurer'
    WarriorClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Warrior'
    ClericClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Cleric'
    CadetClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Cadet'
    MageClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Mage'
    KnightClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Knight'

    // Classes added by mod
    BishopClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Bishop'
    ScholarClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Scholar'
    MercenaryClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Mercenary'
    MoonSageClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_MoonSage'
    LuminaryClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Luminary'

    // Level up cards added by mod
    BishopCard=RPGTacCharacterClass_LevelUpCard'MoreClassesModContent.LevelUpCards.Card_Class_Bishop'
}
