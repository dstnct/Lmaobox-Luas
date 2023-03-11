-- This lua gets your Triggerbot Keybind and uses it as Anti-Aim keybind. Crazy
local tahoma = draw.CreateFont( "Tahoma Bold", 30 , 200, 0x200, 0x010)

local function bind()
    local TriggerKey = gui.GetValue("Trigger Key")
    draw.SetFont(tahoma)
    if input.IsButtonDown( TriggerKey ) then
        gui.SetValue( "Anti Aim", 1 )
        draw.Color( 0, 255, 0, 255 )
        draw.Text(15,800,"TriggerSpin")
    else
        gui.SetValue( "Anti Aim", 0 )
        draw.Color( 255, 0, 0, 255 )
        draw.Text(15,800,"TriggerSpin")
    end

end


callbacks.Register("Draw", bind)
callbacks.Register( "draw", primary )
