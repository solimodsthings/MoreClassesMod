// [More Classes Mod for Himeko Sutori (2021)]

// This class updates base game shop inventories and makes
// new recipes available to players.
class ShopModifier extends ContentModifier
    Dependson(RPGTacSupply_CraftingRecipe)
    Dependson(RPGTacSupply);

var EventManager Parent;

function OnInitialization(EventManager Manager) 
{
    self.Parent = Manager;
    self.Id = "MoreClasses.ShopModifier";
}

// We're handling shop events here instead of OnEnterArea() because
// it's not guaranteed that RPGTacKismentOpenShop instances will exist
// immediately after entering the area. If this causes performance issues,
// I suppose we could try OnEnterArea() again but with a timed delay.
function OnCauseEvent(optional Name event)
{
    if((IsCurrentLevel('Main_Desert_Ramliyah') && event == 'TalkToNabil'))
    {
        AddRecipesToShop('RPGTacKismetOpenShop_6'); // Nabil's shop in Ramliyah
    }
    else if(IsCurrentLevel('Main_Halgdalir_Outfitter') && event == 'TalkToShopkeeper')
    {
        AddRecipesToShop('RPGTacKismetOpenShop_2'); // Frej's shop in Halgdalir
    }
    else if(IsCurrentLevel('Main_Shadow4_DholaviraOutpost') && event == 'TalkToVani')
    {
        AddRecipesToShop('RPGTacKismetOpenShop_0'); // Vani's shop in Misfortune's Outpost
    }
    else
    {
        // `log("---------------- OnCauseEvent() : " $ event $ "----------------");
    }
}

private function AddRecipesToShop(Name shopname)
{
    local RPGTacKismetOpenShop Shop;
    Shop = GetShop(shopname);
    if(Shop != none)
    {
        AddRecipe(Shop, HeavyCaliber1Recipe);
        AddRecipe(Shop, HeavyCaliber2Recipe);
        AddRecipe(Shop, HeavyCaliber3Recipe);
    }
}

function AddRecipe(RPGTacKismetOpenShop Shop, RPGTacSupply_CraftingRecipe Recipe)
{
    local SupplyInventory Supply;
    if(!ContainsRecipe(Shop, Recipe))
    {
        Supply.SupplyType = Recipe;
        Supply.Amount = 1;
        Shop.Supplies.AddItem(Supply);
    }
}

function bool ContainsRecipe(RPGTacKismetOpenShop Shop, RPGTacSupply_CraftingRecipe Recipe)
{
    local SupplyInventory Supply;
    foreach Shop.Supplies(Supply)
    {
        if(Supply.SupplyType.ItemName == Recipe.ItemName)
        {
            return true;
        }
    }

    return false;
}

function bool IsCurrentLevel(Name packageName)
{
    local int i;
    for(i = 0; i < Parent.World.StreamingLevels.Length; i++)
    {
        if (Parent.World.StreamingLevels[i] != None && (Parent.World.StreamingLevels[i].bIsVisible || Parent.World.StreamingLevels[i].bHasLoadRequestPending))
        {
            // `log("Comparing " $ packageName $ " and " $ Parent.World.StreamingLevels[i].PackageName);
            if(packageName == Parent.World.StreamingLevels[i].PackageName)
            {
                // `log("IsCurrentLevel() evaluated to true");
                return true;
            }
        }
    }
    // `log("IsCurrentLevel() evaluated to false");
    return false;
}

function RPGTacKismetOpenShop GetShop(Name ShopName)
{
    local Sequence GameSequence;
    local int i;
    local array<SequenceObject> Events;

    GameSequence = Parent.World.GetGameSequence();
    GameSequence.FindSeqObjectsByClass(class'RPGTacKismetOpenShop', TRUE, Events);

    // `log("Finding whether shop exists or not... events length is " $ Events.Length);
    for (i = 0; i < Events.Length; i++)
    {    
        // `log("Checking Shop: " $ Events[i].Name $ " == " $ ShopName);        
        if(Events[i].Name == ShopName)
        {
            return RPGTacKismetOpenShop(Events[i]);
        }
    }

    return none;
}

DefaultProperties 
{

}
