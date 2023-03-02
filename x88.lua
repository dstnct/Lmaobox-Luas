--[[
This lua script is designed to display settings on LMAOBox using its draw.text function in their lua API.

  The script includes two functions, primary and secondary. The primary function renders some basic text.
The secondary function retrieves the values of various settings and renders the corresponding text.

  These settings include aimbot, aim method, aim FOV, double tap, double tap charged ticks, anti-aim, colored players,
ESP, fake latency value, triggerbot, bunny hop, auto strafe, no hands, no scope, custom FOV, third person, and trigger shoot delay.

The script was written by ActiveDistinct (actv#0142) and bug reports, suggestions, and requests can be made through discord: actv#0142 or telegram: @ActiveDistinct


]]

-- This line creates a new font object with the name "Tahoma Bold", size 15, weight 590 and flag 0x200.
local tahoma = draw.CreateFont("Tahoma Bold", 15, 590, 0x200)
local current_fps = 0
-- This line creates a new font object with the name "Verdana", size 30, weight 800 and flag FONTFLAG_DROPSHADOW.
local verdana = draw.CreateFont("Verdana", 30, 800, FONTFLAG_DROPSHADOW)

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

--[[ 

The secondary function retrieves the values of various settings and renders the corresponding text.
-It sets the font to the "tahoma" font object and the color to white.
then retrieves the value of "current_fps" and updates it if 50 frames have passed since the last update.
afterwards checks whether the game coordinator is connected to a match server and if so, renders the text for various settings.

]]
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

    draw.SetFont(tahoma)
    draw.Color(255, 255, 255, 255)
    if globals.FrameCount() % 50 == 0 then
        current_fps = math.floor(1 / globals.FrameTime())
    end
    if  engine.IsGameUIVisible() == false then
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

        if (dtTicks >= 20) then
            draw.SetFont(verdana)
            draw.Color(0, 255, 0, 255)
            draw.Text(10, 1000, "DT")
        else
            draw.SetFont(verdana)
            if (dtTicks < 5) then
                draw.Color(255, 0, 0, 255)
                draw.Text(10, 1000, "DT")
            else
                draw.Color(255, 0, 0, 255)
                draw.Text(10, 1000, "DT")
            end
        end
    else
        return
    end
end -- This marks the end of the secondary function


-- Registering a function named "primary" to be called during the Draw event
callbacks.Register("Draw", primary)
--[[ 
Registering a function named "secondary" to be called during the Draw event, 
and assigning the name "draw" to this registration for later use in other parts of the code
]]
callbacks.Register("Draw", "draw", secondary)
