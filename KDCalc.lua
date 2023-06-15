local tahoma = draw.CreateFont( "Tahoma Bold", 16 , 200, 0x200, 0x010)
local killCount = 0;
local deathCount = 0;
local assistCount = 0;
local KDCount = 0;
local str = KDCount

local player = entities.GetLocalPlayer()

local ScrW, ScrH = draw.GetScreenSize()
local MidW = ScrW / 2
local MidH = ScrH / 2




previousIp = engine.GetServerIP()
previousMap = engine.GetMapName()

local function onDeath(event) -- credits: Derser (Habnone)

    if (event:GetName() == 'player_death' ) then

        local localPlayer = entities.GetLocalPlayer();
        local attacker = entities.GetByUserID(event:GetInt("attacker"))
        local userid = entities.GetByUserID(event:GetInt("userid"))
        local assister = entities.GetByUserID( event:GetInt("assister"))

        if (localPlayer:GetIndex() == userid:GetIndex()) then
            if(localPlayer:InCond(13)) then return end -- dont do anything if you have deadrang
            deathCount = deathCount + 1
            if(localPlayer:InCond(13) ) then
                deathCount = deathCount - 1
            end
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
    
    if(deathCount == 0) then
        KDCount = killCount
        str = killCount
    elseif(deathCount >=0) then
        KDCount = killCount / deathCount
        str = killCount / deathCount
        str = string.format("%.2f",KDCount) --thnx lnx
    end

        draw.Color( 126, 227, 59, 255 )
        draw.Text( 80, 460, str)
    
        if(KDCount >= 2) then
            draw.Color( 189, 155, 25, 255 )
            draw.Text( 80, 460, str)
        end
        
        if(KDCount >= 3) then
            draw.Color( 175, 65, 84, 255 )
            draw.Text( 80, 460, str)
        end

        local currentIP = engine.GetServerIP()
        local currentMap = engine.GetMapName()

  

        
        if (currentIP == nil or currentIP ~= previousIP) then
            killCount = 0;
            deathCount = 0;
            assistCount = 0;
            str = "0";
        end

        if(currentMap ~= previousMap) then
            killCount = 0;
            deathCount = 0;
            assistCount = 0;
            str = "0";
        end
        previousMap = currentMap
        previousIP = currentIP
    if( engine.IsGameUIVisible() == false )  then

        if(player:InCond(29) ) then
            draw.SetFont(tahoma)
            draw.Color(240, 240, 240, 255)
            draw.Text(MidW -45 , MidH +20, "- RAGE BUFF -")

        else end

        if (player:IsCritBoosted() ) then -- Checks whether you're crit-boosted or speed-buffed and renders the appropriate text.
            draw.SetFont(tahoma)
            draw.Color(240, 240, 240, 255)
            draw.Text(MidW -45 , MidH +20, "CRIT BOOST")
        else end -- if not crit-boosted dont do anything

        if(player:InCond( 17 ) ) then
            draw.SetFont(tahoma)
            draw.Color(240, 240, 240, 255)
            draw.Text(MidW -45 , MidH +20, "CHARGING")
        else end
    
    end
end
print(math.floor(KDCount+0.5))
callbacks.Register("FireGameEvent", "whenDeath", onDeath)
callbacks.Register( "Draw", textDraw)
