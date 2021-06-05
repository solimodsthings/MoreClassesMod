// [More Classes Mod (2021)]

class ContentModifier extends EventListener
    placeable;

// Part of original game
var RPGTacCharacterClass StudentClass;
var RPGTacCharacterClass AdventurerClass;
var RPGTacCharacterClass ClericClass;
var RPGTacCharacterClass CadetClass;
var RPGTacCharacterClass MageClass;
var RPGTacCharacterClass KnightClass;

// Classes added by mod
var RPGTacCharacterClass BishopClass;
var RPGTacCharacterClass ScholarClass;
var RPGTacCharacterClass MercenaryClass;
var RPGTacCharacterClass MoonSageClass;
//var RPGTacCharacterClass SpellswordClass;

// Level up cards added by mod
var RPGTacCharacterClass_LevelUpCard BishopCard;

DefaultProperties
{
    // Part of original game
    StudentClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Student'
    AdventurerClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Adventurer'
    ClericClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Cleric'
    CadetClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Cadet'
    MageClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Mage'
    KnightClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Knight'

    // Classes added by mod
	BishopClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Bishop'
    ScholarClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Scholar'
    MercenaryClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Mercenary'
    MoonSageClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_MoonSage'
    // SpellswordClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Spellsword'

    // Level up cards added by mod
    BishopCard=RPGTacCharacterClass_LevelUpCard'MoreClassesModContent.LevelUpCards.Card_Class_Bishop'
}
