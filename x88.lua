local tahoma = draw.CreateFont("Tahoma Bold", 15, 590, 0x200)
local current_fps = 0

local verdana = draw.CreateFont("Verdana Bold", 25, 800, FONTFLAG_ANTIALIAS | FONTFLAG_DROPSHADOW)

playerName = steam.GetPlayerName( steam.GetSteamID() )
local function primary() 
    draw.SetFont(tahoma)
    draw.Color(255, 255, 0, 255)
    draw.Text(270, 5, "Hello ActiveDistinct :)")
    draw.Text(390, 25, "FrameRate  " .. current_fps .. "")
    draw.Text(270, 25, "Hello "..playerName.." :)")
end


local function secondary()
    if (engine.IsGameUIVisible() == false) then
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
        player = entities.GetLocalPlayer()
        local wpn = player:GetPropEntity("m_hActiveWeapon")


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
else return end
end -- end of secondary function
end
callbacks.Register("Draw", primary)
callbacks.Register("Draw", "draw", secondary)
