-- A basic encounter script skeleton you can copy and modify for your own creations.
require "Animations/someone"

-- music = "shine_on_you_crazy_diamond" --Either OGG or WAV. Extension is added automatically. Uncomment for custom music.
encountertext = "What a shame..." --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {""}
wavetimer = 4.0
autolinebreak = true
arenasize = {155, 130}

enemies = {
"someone"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {}

function EncounterStarting()
    Audio.Stop()
    -- If you want to change the game state immediately, this is the place.
end

function Update()
    UpdateAnimation()
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
    State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    BattleDialog({"Selected item " .. ItemID .. "."})
end

function SetHeadAnimation(sprites)
    animation = {sprites, sprites.."2"}
    SetPartAnimation("head", animation, 1/8)
end

function SetHead(sprite)
    SetPartAnimation("head", {sprite})
end