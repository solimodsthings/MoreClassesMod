// [More Classes Mod for Himeko Sutori (2021)]

// This is a convenient base class for other modifier classes
// to inherit from.
class ContentModifier extends Plugin
    placeable;

// Part of original game
var RPGTacCharacterClass StudentClass;
var RPGTacCharacterClass AdventurerClass;
var RPGTacCharacterClass WarriorClass;
var RPGTacCharacterClass ClericClass;
var RPGTacCharacterClass CadetClass;
var RPGTacCharacterClass MageClass;
var RPGTacCharacterClass GunnerClass;
var RPGTacCharacterClass KnightClass;
var RPGTacCharacterClass BerserkerClass;
var RPGTacCharacterClass WarlockClass;
var RPGTacCharacterClass RogueClass;

var RPGTacCharacterClass SlimeClass;

// Classes added by mod
var RPGTacCharacterClass BishopClass;
var RPGTacCharacterClass ScholarClass;
var RPGTacCharacterClass MercenaryClass;
var RPGTacCharacterClass MoonSageClass;
var RPGTacCharacterClass LuminaryClass;
var RPGTacCharacterClass GuardianClass;
var RPGTacCharacterClass DruidClass;
var RPGTacCharacterClass PeacekeeperClass;
var RPGTacCharacterClass WarmasterClass;
var RPGTacCharacterClass HexbladeClass;

var RPGTacCharacterClass MudbastionClass;
var RPGTacCharacterClass SludgelordClass;

// Level up cards added by mod
var RPGTacCharacterClass_LevelUpCard BishopCard;

// Recipes
var RPGTacSupply_CraftingRecipeEquipment HeavyCaliber1Recipe;
var RPGTacSupply_CraftingRecipeEquipment HeavyCaliber2Recipe;
var RPGTacSupply_CraftingRecipeEquipment HeavyCaliber3Recipe;

// Status Effects
var RPGTacStatusEffect BloodCurseStatusEffect;

protected function bool IsClass(RPGTacCharacterClass TargetClassInstance, RPGTacCharacterClass CharacterClassArchetype)
{
    return RPGTacCharacterClass(TargetClassInstance.ObjectArchetype).ClassName == CharacterClassArchetype.ClassName;
}

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
    DruidClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Druid'
    GunnerClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Gunner'
    BerserkerClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Berserker'
    WarlockClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Warlock'
    RogueClass=RPGTacCharacterClass'HimekoSutoriContent.CharacterClasses.CharacterClass_Rogue'
    

    SlimeClass=RPGTacCharacterClass'himekosutoricontent.CharacterClasses.Monster_CharacterClass_Slime'

    // Classes added by mod
    BishopClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Bishop'
    ScholarClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Scholar'
    MercenaryClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Mercenary'
    MoonSageClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_MoonSage'
    LuminaryClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Luminary'
    GuardianClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Guardian'
    PeacekeeperClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Peacekeeper'
    WarmasterClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Warmaster'
    HexbladeClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.CharacterClass_Hexblade'

    MudbastionClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.Monster_CharacterClass_Mudbastion'
    SludgelordClass=RPGTacCharacterClass'MoreClassesModContent.CharacterClasses.Monster_CharacterClass_Sludgelord'

    // Level up cards added by mod that need to be inserted into a base class's deck
    BishopCard=RPGTacCharacterClass_LevelUpCard'MoreClassesModContent.LevelUpCards.Card_Class_Bishop'

    // Recipes
    HeavyCaliber1Recipe=RPGTacSupply_CraftingRecipeEquipment'MoreClassesModContent.Recipes.Recipe_Peacekeeper_Blunderbuss'
    HeavyCaliber2Recipe=RPGTacSupply_CraftingRecipeEquipment'MoreClassesModContent.Recipes.Recipe_Peacekeeper_Arquebus'
    HeavyCaliber3Recipe=RPGTacSupply_CraftingRecipeEquipment'MoreClassesModContent.Recipes.Recipe_Peacekeeper_Tanegashima'

    // Statuses
    BloodCurseStatusEffect=RPGTacStatusEffect'MoreClassesModContent.StatusEffects.Status_BloodCurse'
}
