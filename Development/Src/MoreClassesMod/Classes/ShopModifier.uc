class ShopModifier extends ContentModifier
    Dependson(RPGTacSupply_CraftingRecipe)
    Dependson(RPGTacSupply);

var EventManager Parent;

function OnInitialization(EventManager Manager) 
{
    self.Parent = Manager;
}

function OnCauseEvent(optional Name event)
{
    local RPGTacKismetOpenShop Shop;

    // `log("OnCauseEvent(): " $ event);

    // We're handling shop events here instead of OnEnterArea() because
    // it's not guaranteed that RPGTacKismentOpenShop instances will exist
    // immediately after entering the area. If this causes performance issues,
    // I suppose we could try OnEnterArea() after a timed delay.
    if(event == 'TalkToNabil')
    {        
        if(IsCurrentLevel('Main_Desert_Ramliyah'))
        {
            Shop = GetShop('RPGTacKismetOpenShop_6'); // Nabil's shop
            if(Shop != none)
            {
                AddRecipe(Shop, PeacekeeperTanegashimaRecipe);
            }
        }
    }
}

// Called whenever the player enters an area that is not a world map
function OnEnterArea() 
{       
    // `log("OnEnterArea()");
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