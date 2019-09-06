

cut = false
updating = true
cuttimer = 0
animationtimer = 0

legs = CreateSprite("appearance/legs/normal", "BelowArena")
legs.x = 320
legs.y = 279

torso = CreateSprite("appearance/torso/normal", "BelowArena")
torso.SetAnchor(0.5, 1)
torso.SetParent(legs)
torso.y = 33

head = CreateSprite("appearance/head/hidden", "BelowArena")
head.SetAnchor(0.5, 1)
head.SetParent(torso)
head.y = 33

hair = CreateSprite("appearance/hair", "BelowArena")
hair.SetAnchor(0.4, 1)
hair.SetParent(head)
hair.y = -52
hair.x = 16

function UpdateAnimation()
    if updating then
        animationtimer = animationtimer + 1
        torso.Scale(1, 1 + math.sin(animationtimer/180*math.pi) / 50)
        torso.y = 33 + math.sin(animationtimer/180*math.pi)
        hair.rotation = math.cos(animationtimer/55*math.pi)
        hair.x = 16 + math.cos(animationtimer/55*math.pi)
    end
    if cut and cuttimer <= 15 then
        cuttimer = cuttimer + 1
        hair.y = hair.y - 0.5
        hair.alpha = hair.alpha - 1/15
    end
end

function Immobilize()
    updating = false
    torso.Scale(1, 1)
    torso.y = 33
    if hair.isactive then
        hair.x = 16
        hair.rotation = 0
    end
end

function SetPartAnimation(part, sprites, timer)
    if timer == nil then timer = 5 end
    if part == "head" then
        local animation = {}
        for i=1, #sprites do
            table.insert(animation, "appearance/head/"..sprites[i])
        end
        head.SetAnimation(animation, timer)
    elseif part == "torso" then
        local animation = {}
        for i=1, #sprites do
            table.insert(animation, "torso/"..sprites[i])
        end
        torso.SetAnimation(animation, timer)
    elseif part == "legs" then
        local animation = {}
        for i=1, #sprites do
            table.insert(animation, "legs/"..sprites[i])
        end
        legs.SetAnimation(animation, timer)
    end
end

function CutHair()
    cut = true
end