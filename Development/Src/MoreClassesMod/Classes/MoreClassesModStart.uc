// [More Classes Mod for Himeko Sutori (2021)]

class MoreClassesModStart extends ModStart;

function OnStart(CorePlayerController Core)
{
	Core.AddPlugin(new class'CharacterClassModifier');
	Core.AddPlugin(new class'EquipmentModifier');
	Core.AddPlugin(new class'ShopModifier');
}