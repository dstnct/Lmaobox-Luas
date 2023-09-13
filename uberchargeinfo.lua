--[[
    Credits to:
    @flashintv + @Terminatormachine for helping me
    @10trips for adding proper item names
]]

local font = draw.CreateFont("Tahoma", -11, 500, FONTFLAG_OUTLINE | FONTFLAG_CUSTOM)

local function onDraw()
	local lineoffset = 0
    local lineoffsetbox = lineoffset
    if  engine.IsGameUIVisible() == false  then
        local players = entities.FindByClass("CTFPlayer")

        for idx, entity in pairs(players) do
            if entity:GetTeamNumber() == entities.GetLocalPlayer():GetTeamNumber() and entity:GetPropInt("m_iClass") == 5 then 
                local medigun = entity:GetEntityForLoadoutSlot(1)
                local meditype = medigun:AttributeHookInt("set_weapon_mode", 0)
                uber = medigun:GetPropFloat("LocalTFWeaponMedigunData","m_flChargeLevel")
                str = string.format("%.1f",uber)
                percentageValue = math.floor(uber * 100)
                draw.SetFont(font)
 
                if(percentageValue == 0.0) then
                    draw.Color(170, 170, 170, 255) -- white
                elseif(percentageValue > 40.0) then
                    draw.Color(255, 255, 0, 255) -- yellow
                else
                    draw.Color(0, 255, 0, 255) -- green
                end
                if(percentageValue > 70.0) then
                    draw.Color(255, 0, 0, 255) -- red
                end
                draw.Text(20, 135+(lineoffset*15), entity:GetName().."      "..medigun:ToInventoryItem():GetName().."       "..percentageValue.."%")
                --draw.Text(20*10, 135+(lineoffset*15),percentageValue.."%")
                lineoffset = lineoffset + 1
            end
        end
        draw.Color(0, 0, 0, 100)
        draw.FilledRect( 5 + (lineoffset), 110 + (lineoffset), 23*10 +(lineoffset*20), 140 + (lineoffset*15))
        draw.SetFont(font)
        draw.Color(255, 255, 255, 255)
        draw.Text(10*7, 115, "Team Ubercharge Info")
    else return end
end

engine.PlaySound("buttons/button3.wav")
callbacks.Unregister( "Draw", "medigunDraw", onDraw )
callbacks.Register( "Draw", "medigunDraw", onDraw )
