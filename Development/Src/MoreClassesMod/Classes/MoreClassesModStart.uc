// [More Classes Mod for Himeko Sutori (2021)]

class MoreClassesModStart extends EventMutator;

function OnEventManagerCreated(EventManager Manager)
{
	Manager.AddListener(new class'CharacterClassModifier');
	Manager.AddListener(new class'EquipmentModifier');
	Manager.AddListener(new class'ShopModifier');
	Manager.World = WorldInfo; // TODO: Should this call be done by EventsMod?
	Manager.Game = RPGTacGame(WorldInfo.Game);
}