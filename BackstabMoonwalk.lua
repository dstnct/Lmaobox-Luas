local tahoma = draw.CreateFont( "Tahoma Bold", 17 , 200, 0x200, 0x010)
local function bind()
    local TriggerKey = gui.GetValue("Trigger Key")
    draw.SetFont(tahoma)
    if input.IsButtonDown( TriggerKey ) then
        gui.SetValue( "Anti Aim", 1 )
        gui.SetValue( "Anti Aim - Yaw (Real)", "Back" )
        gui.SetValue( "Anti Backstab", 1 )
        draw.Color( 0, 255, 0, 255 )
        draw.Text(15,800,"MoonWalk")
    else
        gui.SetValue( "Anti Aim", 0 )
        gui.SetValue( "Anti Aim - Yaw (Real)", "OFF" )
        gui.SetValue( "Anti Backstab", 0 )
        draw.Color( 255, 0, 0, 255 )
        draw.Text(15,800,"MoonWalk")
    end

end

callbacks.Register("Draw", bind)