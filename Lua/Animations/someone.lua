


animationtimer = 0

legs = CreateSprite("appearance/legs/normal", "BelowArena")
legs.x = 320
legs.y = 275

torso = CreateSprite("appearance/torso/normal", "BelowArena")
torso.SetAnchor(0.5, 1)
torso.SetParent(legs)
torso.y = 33

head = CreateSprite("appearance/head/hidden", "BelowArena")
head.SetAnchor(0.5, 1)
head.SetParent(torso)
head.y = 33

function UpdateAnimation()
    animationtimer = animationtimer + 1
    torso.Scale(1, 1 + math.sin(animationtimer/180*math.pi) / 50)
    torso.y = 33 + math.sin(animationtimer/180*math.pi)
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