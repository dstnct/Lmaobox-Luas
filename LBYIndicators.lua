-- Lua made by ActiveDistinct (actv#0142)

local verdana = draw.CreateFont( "Verdana Bold", 25, 800, FONTFLAG_ANTIALIAS | FONTFLAG_DROPSHADOW)


callbacks.Register( "Draw", function ()
    draw.Color(255, 255, 255, 255)
    draw.SetFont( verdana )

    local player = entities.GetLocalPlayer()
if  engine.IsGameUIVisible() == false  then -- this prevents console spam while in main menu and in-game
    local wpn = player:GetPropEntity("m_hActiveWeapon")
    local dtTicks = warp.GetChargedTicks() -- GetChargedTicks() accounts for both Doubletap and Warp :O

    local ScrW, ScrH = draw.GetScreenSize()
    local MidW = ScrW / 2
    local MidH = ScrH / 2

    if player.IsAlive(player) then
        if (dtTicks >= 20) then -- Very poor tick calculation but it does the job
            draw.SetFont(verdana)
            draw.Color(119, 255, 0, 255)
            draw.Text(MidW -950 , MidH + 355, "TICK")
        else
            draw.SetFont(verdana)
            if (dtTicks < 5) then
                draw.Color(255, 71, 71, 255)
                draw.Text(MidW -950 , MidH + 355, "TICK")
                draw.Color(240, 240, 240, 255)
                draw.Text(MidW -890 , MidH + 355, " "..dtTicks)
            else
                draw.Color(255, 71, 71, 255)
                draw.Text(MidW -950 , MidH + 355, "TICK")
                draw.Color(240, 240, 240, 255)
                draw.Text(MidW -890 , MidH + 355, " ".. dtTicks)
            end
        end
    else return end

    if wpn ~= nil then -- this is yeeted from lbox lua website (idk who made this so cant credit, will do when i find out)
        local critChance = wpn:GetCritChance()
        local dmgStats = wpn:GetWeaponDamageStats()
        local totalDmg = dmgStats["total"]
        local criticalDmg = dmgStats["critical"]
        

        local cmpCritChance = critChance + 0.1

        if cmpCritChance > wpn:CalcObservedCritChance() then
            draw.SetFont(verdana)
            draw.Color(119, 255, 0, 255)
            draw.Text(MidW  -950 , MidH + 330, "CRIT")
        else --no crits?
            local requiredTotalDamage = (criticalDmg * (2.0 * cmpCritChance + 1.0)) / cmpCritChance / 3.0
            local requiredDamage = requiredTotalDamage - totalDmg
            draw.Color(255, 71, 71, 255)
            draw.Text(MidW  -950 , MidH + 330, "CRIT")
            draw.Color(240, 240, 240, 255)
            draw.Text(MidW -890 , MidH + 330, " "..math.floor(requiredDamage))
        end
        end
else return end
    end)
engine.PlaySound("buttons/button3.wav")
