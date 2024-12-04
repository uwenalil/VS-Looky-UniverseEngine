cx = 0;
cy = 0;

function onCreate()
    local hx = 3250 / 2;
    local hy = 1750 / 2;
    cx = -500 + hx;
    cy = -450 + hy;

    makeLuaSprite('rbg', 'assist', cx, cy)
    setProperty('rbg.offset.x', hx);
    setProperty('rbg.offset.y', hy);
    setProperty('rbg.antialiasing', true);

    addLuaSprite('rbg', false)

end
fr = 0
function onUpdate(elapsed)
    fr = fr + elapsed;

    setProperty('rbg.scale.x', 1 + math.cos(fr*3) / 6)
    setProperty('rbg.scale.y', 1 + math.cos(fr*3 + 2) / 6)
    setProperty('rbg.angle', math.sin(fr*3) * 8);
    setProperty('rbg.x', cx + math.sin(fr*3) * 200);
    setProperty('rbg.y', cy + math.cos(fr*3) * 200);
end
