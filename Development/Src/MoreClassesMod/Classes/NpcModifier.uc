class NpcModifier extends ContentModifier
    Dependson(RPGTacSupply_CraftingRecipe)
    Dependson(RPGTacSupply);

var EventManager Parent;

function OnInitialization(EventManager Manager) 
{
    self.Parent = Manager;
}

// Called whenever the player enters an area that is not a world map
function OnEnterArea() 
{
    local RPGTacKismetOpenShop Shop;
    

    if(IsCurrentLevel('Main_Desert_Ramliyah'))
    {
        Shop = GetShop('RPGTacKismetOpenShop_6'); // Nabil's shop
        if(Shop != none)
        {
            AddRecipe(Shop, PeacekeeperTanegashimaRecipe);
        }
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
        if(packageName == Parent.World.StreamingLevels[i].PackageName)
        {
            `log("Comparing " $ packageName $ " and " $ Parent.World.StreamingLevels[i].PackageName);
            return true;
        }
    }

    return false;
}

function RPGTacKismetOpenShop GetShop(Name ShopName)
{
    local Sequence GameSequence;
    local int i;
    local array<SequenceObject> Events;

    GameSequence = Parent.World.GetGameSequence();
    GameSequence.FindSeqObjectsByClass(class'RPGTacKismetOpenShop', true, Events);

    for (i = 0; i < Events.Length; i++)
    {            
        if(Events[i].Name == ShopName)
        {
            //`log("SeqObject Name: " $ Events[i].Name);
            return RPGTacKismetOpenShop(Events[i]);
        }
    }

    return none;
}

DefaultProperties 
{

}


/*
foreach Parent.World.AllPawns(class'RPGTacPawn_NPC', TargetNpc)
{
    `log(TargetNpc);
}

foreach Parent.World.AllActors(class'Actor', TargetActor)
{
    `log(TargetActor);
}
*/