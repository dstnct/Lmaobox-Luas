
-- onDeath function credit: Derser (Habnone)
-- TODO: Make the Kill,Death,Assist and KD Counters reset to 0 when the player changed maps

local tahoma = draw.CreateFont( "Tahoma Bold", 16 , 200, 0x200, 0x010)
local killCount = 0;
local deathCount = 0;
local assistCount = 0;
local KDCount = 0;

previousIp = engine.GetServerIP()

local function onDeath(event)

    if (event:GetName() == 'player_death' ) then

        local localPlayer = entities.GetLocalPlayer();
        local attacker = entities.GetByUserID(event:GetInt("attacker"))
        local userid = entities.GetByUserID(event:GetInt("userid"))
        local assister = entities.GetByUserID( event:GetInt("assister"))

        if (localPlayer:GetIndex() == userid:GetIndex()) then
            deathCount = deathCount + 1
        elseif (attacker:GetIndex() == localPlayer:GetIndex()) then
            killCount = killCount + 1
        elseif (assister:GetIndex() == localPlayer:GetIndex()) then
            assistCount = assistCount +1
            
        end
    end
end
-- if KD is greater than 2 kd text becomes yellow, if then it's greater than 3 it becomes red
local function textDraw()
    draw.SetFont(tahoma)
    draw.Color( 255, 255, 255, 255 )
    draw.Text( 20, 400, "Kills:")
    
    draw.Color(126, 227, 59, 255)
    draw.Text( 80, 400, killCount)
    
    draw.Color( 255, 255, 255, 255 )
    draw.Text( 20, 420, "Deaths:")
   
    draw.Color(126, 227, 59, 255)
    draw.Text( 80, 420, deathCount)
    
    draw.Color( 255, 255, 255, 255 )
    draw.Text( 20, 440, "Assists:")
   
    draw.Color(126, 227, 59, 255)
    draw.Text( 80, 440, assistCount)
    
    draw.Color( 255, 255, 255, 255 )
    draw.Text( 20, 460, "KD:")
    
    --/////////////////////////////////////////////////////
    if(deathCount == 0) then
        KDCount = killCount
    elseif(deathCount >=0) then
        KDCount = killCount / deathCount
    end
    

        draw.Color( 0, 230, 64, 255 )
        draw.Text( 80, 460, KDCount)
    
        if(KDCount >= 2) then
            draw.Color( 189, 155, 25, 255 )
            draw.Text( 80, 460, KDCount)
        end
        
        if(KDCount >= 3) then
            draw.Color( 175, 65, 84, 255 )
            draw.Text( 80, 460, KDCount)
        end

        local currentIP = engine.GetServerIP()

  

        
        if (currentIP == nil or currentIP ~= previousIP) then
            killCount = 0;
            deathCount = 0;
            assistCount = 0;
            KDCount = 0;
        end
        previousIP = currentIP
end

callbacks.Register("FireGameEvent", "whenDeath", onDeath)
callbacks.Register( "Draw", textDraw)
