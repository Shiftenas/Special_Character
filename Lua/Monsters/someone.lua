-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Smells like the work\rof an enemy stand.", "Poseur is posing like his\rlife depends on it.", "Poseur's limbs shouldn't be\rmoving in this way."}
commands = {"Check", "Act 2", "Act 3"}
randomdialogue = {"[func:LocalSetHeadAnimation, hidden][effect:none]You want something that I won't let you,[func:ResetAnimation, hidden][w:2] [func:LocalSetHeadAnimation, hidden]is that right ?[func:ResetAnimation, hidden]"}

sprite = "empty" --Always PNG. Extension is added automatically.
name = "???"
hp = 60
atk = 4
def = 1
voice = "v_normal"
check = "Do not insult its hair."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = false
xp = 0
gold = 1

function LocalSetHeadAnimation(sprite)
    Encounter.Call("SetHeadAnimation", sprite)
end

function ResetAnimation(sprite)
    Encounter.Call("SetHead", sprite)
end

-- Happens after the slash animation but before the animation.
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "ACT 1" then
        currentdialogue = {"Selected\nAct 1."}
    elseif command == "ACT 2" then
        currentdialogue = {"Selected\nAct 2."}
    elseif command == "ACT 3" then
        currentdialogue = {"Selected\nAct 3."}
    end
    currentdialogue = {currentdialogue[1]}
    BattleDialog({"You selected " .. command .. "."})
end