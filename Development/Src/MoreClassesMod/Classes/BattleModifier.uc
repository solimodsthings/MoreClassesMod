// [More Classes Mod for Himeko Sutori (2021)]

// Implements custom battle logic for some of the
// new classes.
class BattleModifier extends ContentModifier
    dependson(CorePlayerController)
    dependson(RPGTacTeamAIController)
    dependson(RPGTacGame);

var int DefeatedEnemiesCurrentTurn;
var int DefeatedEnemiesTotal;

DefaultProperties
{
    Id = "MoreClasses.BattleModifier"
    DefeatedEnemiesCurrentTurn = 0
    DefeatedEnemiesTotal = 0
}

function OnPawnDefeated(RPGTacPawn DefeatedPawn, bool IsAlly) 
{
    local int BloodCurseDamage;
    local RPGTacPawn SquadMember;
    local RPGTacStatusEffect BloodCurse;

    if(!IsAlly)
    {
        DefeatedEnemiesCurrentTurn++;
        DefeatedEnemiesTotal++;

        // Hexblade special debuff:
        if(HasStatus(DefeatedPawn, BloodCurseStatusEffect))
        {
            // `log("Enemy '" $ DefeatedPawn $ "' died with Blood curse...");
            BloodCurseDamage = int(DefeatedPawn.MaxHitPoints * 0.20);

            foreach DefeatedPawn.Squad.Pawns(SquadMember)
            {
                BloodCurse = Core.Spawn(class'RPGTacStatusEffect',,,,,BloodCurseStatusEffect);
                SquadMember.RPGTacTakeDamage(BloodCurseDamage, "NotHealing", false);
                SquadMember.ReceiveStatus(BloodCurse, 0);

                // `log("Blood curse apread to '" $ SquadMember.CharacterName $ "'...");
            }
        }

    }

}


function OnBattleTurnStart() 
{
    local RPGTacSquad Squad;
    local RPGTacPawn Pawn;
    local RPGTacCharacterClass CharacterClass;
    local RPGTacStatusEffect StatusEffect;
    local RPGTacTeamAIController EnemyController;

	EnemyController = RPGTacTeamAIController(Core.Game.Teams[1]);
    
    foreach Core.DeployedSquads(Squad)
    {
        foreach Squad.Pawns(Pawn)
        {
            CharacterClass = Pawn.CharacterClasses[Pawn.CurrentCharacterClass];

            // Warmaster special ability:
            if(super.IsClass(CharacterClass, WarmasterClass))
            {
                if(DefeatedEnemiesCurrentTurn > 0)
                {
                    Pawn.RPGTacTakeDamage(int(DefeatedEnemiesCurrentTurn * (Pawn.MaxHitPoints * 0.02)), "Healing", false);
                }
            }
        }
    }

    foreach EnemyController.Squads(Squad)
    {
        foreach Squad.Pawns(Pawn)
        {
            // Hexblade special ability - make blood curse visible
            StatusEffect = GetStatus(Pawn, BloodCurseStatusEffect);

            if(StatusEffect != none)
            {
                ReplayParticleEffect(Pawn, StatusEffect);            
            }
        }
    }

    DefeatedEnemiesCurrentTurn = 0;
}

private function ReplayParticleEffect(RPGTacPawn pawn, RPGTacStatusEffect effect)
{
    pawn.DetachComponent(effect.ParticleComponent);
    effect.ParticleComponent.KillParticlesForced();
    effect.ParticleComponent.DeactivateSystem();
    effect.ParticleComponent = Core.World.MyEmitterPool.SpawnEmitter(effect.Particle, pawn.Location, pawn.Rotation, pawn);
}

function OnBattleStart() 
{
    AddHybridClassBuffs();

    DefeatedEnemiesCurrentTurn = 0;
    DefeatedEnemiesTotal = 0;
}

function OnBattleFirstTurnStart() 
{
    //DEBUG
}

function OnBattleVictory(bool celebrate)
{
    RemoveHybridClassBuffs();
}

function OnBattleRetreatAll()
{
    RemoveHybridClassBuffs();
}

private function AddHybridClassBuffs()
{
    local RPGTacSquad Squad;
    local RPGTacPawn Pawn;
    local RPGTacCharacterClass CharacterClass;
    
    //foreach Core.DeployedSquads(Squad) // Can't tell what's been deployed until first turn
    foreach Core.Squads(Squad)
    {
        foreach Squad.Pawns(Pawn)
        {
            CharacterClass = Pawn.CharacterClasses[Pawn.CurrentCharacterClass];

            if(IsClass(CharacterClass, PeacekeeperClass))
            {
                Pawn.TempRangedAttackBonus += Pawn.Blue + Pawn.Spellcraft + Pawn.Intellect;
                Pawn.CalculateDefaultActionPower(); // So the ranged power value in HUD takes into account temp ranged attack
            }
            else if(IsClass(CharacterClass, WarmasterClass) || IsClass(CharacterClass, HexbladeClass))
            {
                Pawn.TempPhysicalAttackBonus += Pawn.Spirit + Pawn.Spellcraft;
                Pawn.CalculateDefaultActionPower();
            }
            
        }
    }
}

private function RemoveHybridClassBuffs()
{
    local RPGTacSquad Squad;
    local RPGTacPawn Pawn;
    local RPGTacCharacterClass CharacterClass;

    foreach Core.Squads(Squad)
    {
        foreach Squad.Pawns(Pawn)
        {
            CharacterClass = Pawn.CharacterClasses[Pawn.CurrentCharacterClass];
            if(IsClass(CharacterClass, PeacekeeperClass)
               || IsClass(CharacterClass, WarmasterClass)
               || IsClass(CharacterClass, HexbladeClass))
            {
                Pawn.ClearStatusEffects();
                Pawn.CalculateDefaultActionPower();
            }
        }
    }
}

private function bool HasStatus(RPGTacPawn TargetPawn, RPGTacStatusEffect TargetStatus)
{
    local RPGTacStatusEffect Status;

    foreach TargetPawn.StatusEffects(Status)
    {
        if(Status.StatusName == TargetStatus.StatusName)
        {
            return true;
        }
    }

    return false;
}

private function RPGTacStatusEffect GetStatus(RPGTacPAwn TargetPawn, RPGTacStatusEffect TargetStatus)
{
    local RPGTacStatusEffect Status;

    foreach TargetPawn.StatusEffects(Status)
    {
        if(Status.StatusName == TargetStatus.StatusName)
        {
            return Status;
        }
    }

    return none;
}