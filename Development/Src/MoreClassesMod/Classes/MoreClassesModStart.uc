// [More Classes Mod for Himeko Sutori (2021)]

class MoreClassesModStart extends ModStart;

DefaultProperties
{
	ModName = "More Classes Mod"
	IntendedGameTypes[0] = "RPGTacGame.RPGTacGame"
	Plugins[0] = class'CharacterClassModifier'
	Plugins[1] = class'EquipmentModifier'
	Plugins[2] = class'ShopModifier'
	Plugins[3] = class'BattleModifier'
	Plugins[4] = class'ExpansionPlugin'
}


//function OnLoad(PluginCollection plugins)
//{
	// plugins.Add(new class'CharacterClassModifier');
	// plugins.Add(new class'EquipmentModifier');
	// plugins.Add(new class'ShopModifier');
	// plugins.Add(new class'BattleModifier');
	// plugins.Add(new class'ExpansionPlugin'); // DEBUG
//}
