--[[
Script written by ActiveDistinct (actv#0142)
Bug reports, suggestions, and requests can be made through discord: actv#0142 or telegram: @ActiveDistinct

CURRENT VERSION: 1.0.3
GET LATEST VERSION AT: https://github.com/dstnct/Lmaobox-Luas/blob/main/x88.lua

]]

-- This line creates a new font object with the name "Tahoma Bold", size 15, weight 590 and flag 0x200.
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590, 0x200)
local current_fps = 0
-- This line creates a new font object with the name "Verdana", size 30, weight 800 and flag FONTFLAG_DROPSHADOW.
local verdana = draw.CreateFont("Verdana Bold", 25, 800, FONTFLAG_ANTIALIAS | FONTFLAG_DROPSHADOW)

-- The primary function defines text and sets its position and color.
-- It first sets the font to the "tahoma" font object and the color to yellow.
-- It then renders two lines of text, with the second line including the value of the "current_fps" variable.

local function primary()
    draw.SetFont(tahoma)
    draw.Color(255, 255, 0, 255)
    draw.Text(270, 5, "Hello ActiveDistinct :)")
    draw.Text(270, 25, "Hello User :)")
    draw.Text(390, 25, "FrameRate  " .. current_fps .. "")
end



--retrieving  the values of various settings and renders the corresponding text.
local function secondary()
    local aimbot = gui.GetValue("aim bot")
    local aimbotMethod = gui.GetValue("aim method")
    local aimbotfov = gui.GetValue("aim fov")
    local dt = gui.GetValue("Double Tap")
    local dtTicks = warp.GetChargedTicks()
    local aa = gui.GetValue("anti aim")
    local chams = gui.GetValue("colored players")
    local esp = gui.GetValue("players")
    local fakepingvalue = gui.GetValue("fake latency value (ms)")
    local fakeping = gui.GetValue("fake latency")
    local triggerbot = gui.GetValue("trigger shoot")
    local bhop = gui.GetValue("bunny hop")
    local autostrafe = gui.GetValue("auto strafe")
    local nohands = gui.GetValue("no hands")
    local noscope = gui.GetValue("no scope")
    local customfov = gui.GetValue("enable custom fov")
    local fovvalue = gui.GetValue("custom fov value")
    local thirdperson = gui.GetValue("thirdperson")
    local triggerdel = gui.GetValue("trigger shoot delay (ms)")
    local player = entities.GetLocalPlayer()
    local wpn = player:GetPropEntity("m_hActiveWeapon")

    draw.SetFont(tahoma)
    draw.Color(255, 255, 255, 255)
    if globals.FrameCount() % 50 == 0 then
        current_fps = math.floor(1 / globals.FrameTime())
    end
    if  engine.IsGameUIVisible() == false  then
        draw.Text(270, 100, "Triggerbot: ")

        if (triggerbot == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(370, 100, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(370, 100, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(270, 85, "ESP: ")
        if (esp == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(370, 85, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(370, 85, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(270, 70, "AimFov: ")
        if (aimbotfov ~= 0) then
            draw.Color(0, 255, 0, 255)
            draw.Text(370, 70, "" .. aimbotfov)
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(370, 70, "" .. aimbotfov)
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 85, "Bunnyhop: ")
        if (bhop == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(500, 85, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 85, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(270, 55, "AimBot: ")

        if (aimbot == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(370, 55, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(370, 55, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 55, "AimMethod: ")
        if (aimbotMethod ~= 0) then
            draw.Color(0, 255, 0, 255)
            draw.Text(500, 55, "" .. aimbotMethod)
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 55, "" .. aimbotMethod)
        end

        if (aa == 1) then
            draw.Color(255, 0, 0, 255)
            draw.Text(270, 130, "AA: WARNING: ")
            draw.Text(370, 130, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(270, 130, "AA: ")
            draw.Text(370, 130, "OFF")
        end

        draw.Color(255, 255, 255, 255)
        draw.Text(400, 100, "AutoStrafe: ")

        if (autostrafe ~= 0) then
            draw.Color(0, 255, 0, 255)
            draw.Text(500, 100, "" .. autostrafe)
        else
            if (autostrafe == nil) then
                draw.Color(255, 255, 255, 255)
                draw.Text(500, 100, "OFF")
            end
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 115, "NoScope: ")
        if (noscope == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(500, 115, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 115, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 130, "NoHands: ")

        if (nohands == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(500, 130, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 130, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 145, "FOVChanger: ")

        if (customfov == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(500, 145, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 145, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 160, "ViewFOV: ")

        if (fovvalue ~= 0) then
            draw.Color(0, 255, 0, 255)
            draw.Text(500, 160, "" .. fovvalue)
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 160, "" .. fovvalue)
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 175, "FakeLatency: ")

        if (fakeping == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(500, 175, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 175, "OFF")
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(400, 190, "Amount: ")
        if (fakepingvalue ~= 0) then
            draw.Color(0, 255, 0, 255)
            draw.Text(500, 190, "" .. fakepingvalue)
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 190, "" .. fakepingvalue)
        end
        draw.Color(255, 255, 255, 255)

        draw.Text(270, 115, "TriggerDelay: ")
        if (triggerdel ~= 0) then
            draw.Color(0, 255, 0, 255)
            draw.Text(370, 115, "" .. triggerdel)
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(370, 115, "" .. triggerdel)
        end
        draw.Color(255, 255, 255, 255)
        draw.Text(400, 70, "Thirdperson: ")
        if (thirdperson == 1) then
            draw.Color(0, 102, 255, 255)
            draw.Text(500, 70, "ON")
        else
            draw.Color(255, 255, 255, 255)
            draw.Text(500, 70, "OFF")
        end

-- crazy dt indicator code

        if (dtTicks >= 20) then
            draw.SetFont(verdana)
            draw.Color(119, 255, 0, 255)
            draw.Text(10, 900, "DT")
        else
            draw.SetFont(verdana)
            if (dtTicks < 5) then
                draw.Color(255, 71, 71, 255)
                draw.Text(10, 900, "DT")
                draw.Color(150, 150, 150, 255)
                draw.Text(45, 900, " "..dtTicks)
            else
                draw.Color(255, 71, 71, 255)
                draw.Text(10, 900, "DT")
                draw.Color(150, 150, 150, 255)
                draw.Text(45, 900, " ".. dtTicks)
            end
        end
    else
        return
    end -- end of crazy dt indicator code

-- crazy crithax calculations (yeeted from lbox lua examples heheheha)

if wpn ~= nil then
    local critChance = wpn:GetCritChance()
    local dmgStats = wpn:GetWeaponDamageStats()
    local totalDmg = dmgStats["total"]
    local criticalDmg = dmgStats["critical"]
    
    local ScrW, ScrH = draw.GetScreenSize()
    local MidW = ScrW / 2
    local MidH = ScrH / 2

    local cmpCritChance = critChance + 0.1

    -- if we crit
    if cmpCritChance > wpn:CalcObservedCritChance() then
        draw.SetFont(verdana)
        draw.Color(119, 255, 0, 255)
        draw.Text(10, 875, "CRIT")
    else -- no crits?
        local requiredTotalDamage = (criticalDmg * (2.0 * cmpCritChance + 1.0)) / cmpCritChance / 3.0
        local requiredDamage = requiredTotalDamage - totalDmg
        draw.Color(255, 0, 0, 255)
        draw.Text(10, 875, "CRIT")
        draw.Color(240, 240, 240, 255)
        draw.Text(70, 875, " "..math.floor(requiredDamage))
    end
end -- end of crithax calculations
end -- end of secondary function



callbacks.Register("Draw", primary)
callbacks.Register("Draw", "draw", secondary)
