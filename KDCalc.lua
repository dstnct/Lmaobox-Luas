-- onDeath function credit: Derser (Habnone)
-- TODO: Make the Kill,Death,Assist and KD Counters reset to 0 when the player isn't in a server (in-game)

local tahoma = draw.CreateFont( "Tahoma Bold", 17 , 200, 0x200, 0x010)
local killCount = 0;
local deathCount = 0;
local assistCount = 0;
local KDCount = 0;

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
-- if KD is greater than 2.2 kd text becomes yellow, if then it's greater than 3.3 it becomes red
local function textDraw()
    draw.SetFont(tahoma)
    draw.Color( 255, 148, 112, 255 )
    draw.Text( 20, 400, "Kills: " ..killCount)
    draw.Color( 159, 90, 253, 255 )
    draw.Text( 20, 420, "Deaths: " ..deathCount)
    draw.Color( 3, 138, 255, 255 )
    draw.Text( 20, 440, "Assists: " ..assistCount)
    
    KDCount = killCount / deathCount
    KDCount = math.floor(KDCount)
    

        draw.Color( 0, 230, 64, 255 )
        draw.Text( 20, 460, "KD: " ..KDCount.. "")
    
        if(KDCount >= 2) then
            draw.Color( 189, 155, 25, 255 )
            draw.Text( 20, 460, "KD: " ..KDCount.. "")
        end
        
        if(KDCount >= 3) then
            draw.Color( 175, 65, 84, 255 )
            draw.Text( 20, 460, "KD: " ..KDCount.. "")
        end

    local function counterreser(event)
    end
        
end

callbacks.Register("FireGameEvent", "whenDeath", onDeath)
callbacks.Register( "Draw", textDraw)
