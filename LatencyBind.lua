-- Change KeyBinds Through Editing The File.
local font = draw.CreateFont( "Tahoma Bold", 15 , 100, 0x200, 0x010)

-- See what keybind is yours at https://lmaobox.net/lua/Lua_Constants/ in the "Buttons" category


local function bind()
    if input.IsButtonDown( 34 ) then
        gui.SetValue("Fake Latency", 1)
    else
        gui.SetValue("Fake Latency", 0)
    end

end


callbacks.Register("Draw", bind)