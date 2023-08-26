-- original lua author: Muqa
-- gui color automation by: actv (me)


function rgbaToHex(r, g, b, a)
    r = math.floor(r)
    g = math.floor(g)
    b = math.floor(b)
    a = math.floor(a)
    return tonumber("0x".. string.format("%02x%02x%02x%02x", r, g, b, a))
end

-- edit the numbers to change the colours, the format is (RED, GREEN, BLUE, ALPHA)
menublu = rgbaToHex(149,199,254,255)
menured = rgbaToHex(254,99,158,255)
red = rgbaToHex(241,73,117,255)
blu = rgbaToHex(149,199,254,255)

local function colors(Draw)
    if engine.IsGameUIVisible() == false then
        if entities.GetLocalPlayer():GetTeamNumber() == 2 then
            gui.SetValue( "gui color", menured)
        else
            gui.SetValue( "gui color", menublu)
        end
    end
end
callbacks.Register( "Draw", colors)