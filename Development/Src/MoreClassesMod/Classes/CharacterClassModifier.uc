// [More Classes Mod for Himeko Sutori (2021)]

// This class checks whether characters meet requirements
// to unlock hidden classes. It also updates card decks
// if new classes are unlocked the normally through a
// level up card.
class CharacterClassModifier extends ContentModifier
    dependson(EventManager)
    dependson(RPGTacGame);

var EventManager ParentPlayerController;

function OnInitialization(EventManager Manager)
{
    self.ParentPlayerController = Manager;
    self.Id = "MoreClasses.CharacterClassModifier";
    AddCardArchetype(ClericClass, BishopCard);
}

function OnPawnsInitialized(Array<RPGTacPawn> Pawns) 
{
    local RPGTacPawn TargetPawn;
    
    foreach Pawns(TargetPawn)
    {
        CheckForNewClassUnlocks(TargetPawn);
    }
}

function OnPawnLevelUp(RPGTacPawn TargetPawn)
{
    local float GameTime;

    CheckForNewClassUnlocks(TargetPawn);

    // Mage specific stuff
    if(IsClass(TargetPawn.CharacterClasses[TargetPawn.CurrentCharacterClass], MageClass))
    {
        GameTime = ParentPlayerController.Game.GameTime;       

        if(GameTime < 5 || GameTime >= 19 )
        {
            // A mage leveled up during night time, give them access to class Moon Sage
            UnlockClass(TargetPawn, MoonSageClass);
        }

    }

}

// Only called on savestate load and when a level up is detected
private function CheckForNewClassUnlocks(RPGTacPawn TargetPawn)
{
    // Unlocks through level up cards
    EnforceClassProgression(TargetPawn, ClericClass, BishopClass, BishopCard);

    // Unlocks through meeting class level requirements
    if(HasClassInstanceLevel(TargetPawn, StudentClass, 5))
    {
        UnlockClass(TargetPawn, ScholarClass);
    }

    if(HasClassInstanceLevel(TargetPawn, AdventurerClass, 5))
    {
        UnlockClass(TargetPawn, MercenaryClass);
    }

    if(HasClassInstanceLevel(TargetPawn, KnightClass, 5)
        && HasClassInstanceLevel(TargetPawn, MageClass, 5)
        && AtLeastLevel(TargetPawn, 15))
    {
        UnlockClass(TargetPawn, LuminaryClass);
    }

    if(HasClassInstanceLevel(TargetPawn, DruidClass, 5)
        && HasClassInstanceLevel(TargetPawn, ClericClass, 5)
        && AtLeastLevel(TargetPawn, 15))
    {
        UnlockClass(TargetPawn, GuardianClass);
    }

    if(HasClassInstanceLevel(TargetPawn, MageClass, 5)
        && HasClassInstanceLevel(TargetPawn, GunnerClass, 5)
        && AtLeastLevel(TargetPawn, 15))
    {
        UnlockClass(TargetPawn, PeacekeeperClass);
    }

}

// This is used if a new class can only be unlocked by acquiring a level card that is 
// obtainable from a previous class. If an existing save game is loaded that has never
// encountered this mod, it is possible for new level up cards to appear in the "received" 
// list despite the new class not actually being unlocked. This function ensures anyone who 
// has "received" the card, but doesn't have the class unlocked, gets it unlocked properly.
private function EnforceClassProgression(RPGTacPawn TargetPawn, RPGTacCharacterClass PriorArchetypeClass, RPGTacCharacterClass NextArchetypeClass, 
                                 RPGTacCharacterClass_LevelUpCard NextClassLevelUpCard)
{
    local RPGTacCharacterClass CharacterClassInstance;
    local bool HasPriorClass;
    local bool HasNextClass;
    local bool HasNextClassLevelUpCard;
    
    HasPriorClass = false;
    HasNextClass = false;
    HasNextClassLevelUpCard = false;

    foreach TargetPawn.CharacterClasses(CharacterClassInstance)
    {
        if(IsClass(CharacterClassInstance, PriorArchetypeClass))
        {
            HasPriorClass = true;

            if(IsInNormalDeck(CharacterClassInstance, NextClassLevelUpCard))
            {
                HasNextClassLevelUpCard = true;
            }
            
        }
        else if(IsClass(CharacterClassInstance, NextArchetypeClass))
        {
            HasNextClass = true;
        }
    }

    // Check if cards remaining includes Bishop, if it doesn't, check that the Bishop was unlocked, and if it wasn't, add the levelup card
    // as we're dealing with a savestate that has never encountered this mod before.
    if(HasPriorClass && !HasNextClass && !HasNextClassLevelUpCard)
    {
        UnlockClass(TargetPawn, NextArchetypeClass);
    }
}

// Causes a specified pawn to have a desired class unlocked, if it doesn't already.
private function UnlockClass(RPGTacPawn TargetPawn, RPGTacCharacterClass NewArchetypeClass)
{
    local RPGTacCharacterClass NewCharacterClassInstance;

    if(!HasClassArchetype(TargetPawn, NewArchetypeClass) && !HasClassInstance(TargetPawn, NewArchetypeClass))
    {
        // `log('Pawn ' $ targetPawn.CharacterName $ ' unlocked class ' $ NewArchetypeClass.ClassName);
        TargetPawn.CharacterClassArchetypes.AddItem(NewArchetypeClass);
        NewCharacterClassInstance = ParentPlayerController.SpawnCharacterClassInstance(NewArchetypeClass);
        NewCharacterClassInstance.Initialize();
        TargetPawn.CharacterClasses.AddItem(NewCharacterClassInstance);
    }
    
}

private function AddCardArchetype(RPGTacCharacterClass ArchetypeClass, RPGTacCharacterClass_LevelUpCard ArchetypeCard)
{
    if(!IsInArchetypeDeck(ArchetypeClass, ArchetypeCard))
    {
        // `log(self $ " ArchetypeClass " $ ArchetypeClass.ClassName $ " is NOW permitted to get ArchetypeCard " $ ArchetypeCard);
        ArchetypeClass.LevelUpCardArchetypes.AddItem(ArchetypeCard);
    }

}

private function bool IsInArchetypeDeck(RPGTacCharacterClass TargetClass, RPGTacCharacterClass_LevelUpCard ArchetypeCard)
{
    local RPGTacCharacterClass_LevelUpCard Card;
    
    foreach TargetClass.LevelUpCardArchetypes(Card)
    {
        if(Card.CardName == ArchetypeCard.CardName)
        {
            return true;
        }
    }
    
    return false;
}

private function bool IsInNormalDeck(RPGTacCharacterClass TargetClass, RPGTacCharacterClass_LevelUpCard ArchetypeCard)
{
    local RPGTacCharacterClass_LevelUpCard Card;
    
    foreach TargetClass.LevelUpCardDeck(Card)
    {
        if(RPGTacCharacterClass_LevelUpCard(Card.ObjectArchetype).CardName == ArchetypeCard.CardName)
        {
            return true;
        }
    }
    
    return false;
}


private function bool HasClassArchetype(RPGTacPawn TargetPawn, RPGTacCharacterClass CharacterClassArchetype)
{
    local RPGTacCharacterClass TargetArchetypeClass;
    
    // `log("HasClassArchetype(): on pawn " $ TargetPawn.CharacterName);

    foreach TargetPawn.CharacterClassArchetypes(TargetArchetypeClass)
    {
        if(IsArchetype(TargetArchetypeClass, CharacterClassArchetype))
        {
            return true;
        }
    }

    return false;
}

private function bool HasClassInstance(RPGTacPawn TargetPawn, RPGTacCharacterClass CharacterClassArchetype)
{
    return HasClassInstanceLevel(TargetPawn, CharacterClassArchetype, -1);
}

// Returns true if the specified pawn has unlocked the
// specified class and also has a specific class level or greater.
private function bool HasClassInstanceLevel(RPGTacPawn TargetPawn, RPGTacCharacterClass CharacterClassArchetype, int ClassLevel)
{
    local RPGTacCharacterClass CharacterClassInstance;
    local bool HasClassLevel;

    HasClassLevel = false;

    foreach TargetPawn.CharacterClasses(CharacterClassInstance)
    {
        if(IsClass(CharacterClassInstance, CharacterClassArchetype))
        {
            HasClassLevel = CharacterClassInstance.ClassLevel >= ClassLevel;
            break;
        }
    }

    return HasClassLevel;
}

private function bool IsArchetype(RPGTacCharacterClass TargetClassArchetype, RPGTacCharacterClass CharacterClassArchetype)
{
    // `log("IsArchetype(): '" $ TargetClassArchetype.ClassName $ "' == '" $ CharacterClassArchetype.ClassName $ "'");
    return TargetClassArchetype.ClassName == CharacterClassArchetype.ClassName;
}

private function bool IsClass(RPGTacCharacterClass TargetClassInstance, RPGTacCharacterClass CharacterClassArchetype)
{
    return RPGTacCharacterClass(TargetClassInstance.ObjectArchetype).ClassName == CharacterClassArchetype.ClassName;
}

private function bool AtLeastLevel(RPGTacPawn TargetPawn, int CharacterLevel)
{
    return TargetPawn.CharacterLevel >= CharacterLevel;
}