// [More Classes Mod for Himeko Sutori (2021)]

class MoreClassesModStart extends EventMutator;

function OnEventManagerCreated(EventManager Manager)
{
	Manager.AddListener(new class'CharacterClassModifier');
	Manager.AddListener(new class'EquipmentModifier');
	Manager.AddListener(new class'ShopModifier');
	Manager.World = WorldInfo;
	Manager.Game = RPGTacGame(WorldInfo.Game);
	`log("MOD LOADED: More Classes Mod");
}