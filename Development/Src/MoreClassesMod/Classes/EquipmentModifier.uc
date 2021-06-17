// [More Classes Mod for Himeko Sutori (2021)]

// This class checks whether an item's "AllowedCharacterClasses"
// list needs to be updated and does so to permit new classes
// to use existing base game weapons and armor as required.
class EquipmentModifier extends ContentModifier
    dependson(RPGTacSupply_CraftingRecipe);

// Override
function OnPawnsInitialized(Array<RPGTacPawn> Pawns) 
{   
    local RPGTacPawn TargetPawn;
    foreach Pawns(TargetPawn)
    {
        ModifyEquipment(TargetPawn.BodySlotItem);
        ModifyEquipment(TargetPawn.MainHandItem);
        ModifyEquipment(TargetPawn.OffHandItem);
        ModifyEquipment(TargetPawn.HeadSlotItem);
        ModifyEquipment(TargetPawn.AccessoryItem);
    }
}

// Override
function OnEquipmentInventoryInitialized(Array<EquipmentInventory> EquimentInventory) 
{
    local EquipmentInventory InventoryItem;
    foreach EquimentInventory(InventoryItem)
    {
        ModifyEquipment(InventoryItem.Equipment);
    }
}

// Override
function OnEquipmentInventoryItemUpdate(EquipmentInventory InventoryItem) 
{
    ModifyEquipment(InventoryItem.Equipment);
}

// Override
function OnShopInventoryItemUpdate(RPGTacEquipment Equipment) 
{
    ModifyEquipment(Equipment);
}

private function ModifyEquipment(RPGTacEquipment Equipment)
{
    if(Equipment != none)
    {
        Mirror(ClericClass, BishopClass, Equipment);
        Mirror(StudentClass, ScholarClass, Equipment);
        Mirror(AdventurerClass, MercenaryClass, Equipment);
        Mirror(WarriorClass, MercenaryClass, Equipment);
        Mirror(MageClass, MoonSageClass, Equipment);
        Mirror(MageClass, LuminaryClass, Equipment);
        Mirror(KnightClass, LuminaryClass, Equipment);
        Mirror(DruidClass, GuardianClass, Equipment);

        if(RPGTacEquipmentMainHand(Equipment) == none) // only mirror armor
        {
            Mirror(GunnerClass, PeacekeeperClass, Equipment);
        }
        
    }
}

private function Mirror(RPGTacCharacterClass SourceClass, RPGTacCharacterClass DestinationClass, RPGTacEquipment TargetEquipment)
{
    if(CanBeEquipped(SourceClass, TargetEquipment))
    {
        AllowEquipment(DestinationClass, TargetEquipment);
    }
}

private function AllowEquipment(RPGTacCharacterClass TargetClass, RPGTacEquipment TargetEquipment)
{
    if(!CanBeEquipped(TargetClass, TargetEquipment))
    {
        // `log(self $ " TargetClass " $ TargetClass.ClassName $ " is NOW permitted to use TargetEquipment " $ TargetEquipment);
        TargetEquipment.AllowedCharacterClasses.AddItem(TargetClass);
    }
}

private function bool CanBeEquipped(RPGTacCharacterClass TargetClass, RPGTacEquipment TargetEquipment)
{
    local RPGTacCharacterClass AllowedClass;
    
    foreach TargetEquipment.AllowedCharacterClasses(AllowedClass)
    {
        if(AllowedClass.ClassName == TargetClass.ClassName)
        {
            return true;
        }
    }

    return false;
}
