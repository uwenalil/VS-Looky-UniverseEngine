function onCreate()
    makeLuaSprite('BnW bg', nil, -2500, -1200)
    makeGraphic('BnW bg',5000,5000,'ffffff')
    addLuaSprite('BnW bg', false)
    scaleObject('BnW bg', 5, 5);
    setScrollFactor('BnW bg', 0, 0)
    setProperty('BnW bg.alpha', 0)
end

function onEvent(n,v1,v2)
    if n == 'BnW bg' then

        --White background, character's shadows black
        if v1 == '1' then
            setProperty('BnW bg.colorTransform.greenOffset', 0)
            setProperty('BnW bg.colorTransform.redOffset', 0)
            setProperty('BnW bg.colorTransform.blueOffset', 0)
            setProperty('dad.colorTransform.greenOffset', -255)
            setProperty('dad.colorTransform.redOffset', -255)
            setProperty('dad.colorTransform.blueOffset', -255)
            setProperty('boyfriend.colorTransform.greenOffset', -255)
            setProperty('boyfriend.colorTransform.redOffset', -255)
            setProperty('boyfriend.colorTransform.blueOffset', -255)
            setProperty('gf.colorTransform.greenOffset', -255)
            setProperty('gf.colorTransform.redOffset', -255)
            setProperty('gf.colorTransform.blueOffset', -255)
            setProperty('BnW bg.alpha', 1)
        end

        --Black background, character's shadows white
        if v1 == '2' then
            setProperty('BnW bg.colorTransform.greenOffset', -255)
            setProperty('BnW bg.colorTransform.redOffset', -255)
            setProperty('BnW bg.colorTransform.blueOffset', -255)
            setProperty('dad.colorTransform.greenOffset', 255)
            setProperty('dad.colorTransform.redOffset', 255)
            setProperty('dad.colorTransform.blueOffset', 255)
            setProperty('boyfriend.colorTransform.greenOffset', 255)
            setProperty('boyfriend.colorTransform.redOffset', 255)
            setProperty('boyfriend.colorTransform.blueOffset', 255)
            setProperty('gf.colorTransform.greenOffset', 255)
            setProperty('gf.colorTransform.redOffset', 255)
            setProperty('gf.colorTransform.blueOffset', 255)
            setProperty('BnW bg.alpha', 1)
        end

        --turn off
        if v1 == '0' then
            setProperty('BnW bg.colorTransform.greenOffset', 0)
            setProperty('BnW bg.colorTransform.redOffset', 0)
            setProperty('BnW bg.colorTransform.blueOffset', 0)
            setProperty('dad.colorTransform.greenOffset', 0)
            setProperty('dad.colorTransform.redOffset', 0)
            setProperty('dad.colorTransform.blueOffset', 0)
            setProperty('gf.colorTransform.greenOffset', 0)
            setProperty('gf.colorTransform.redOffset', 0)
            setProperty('gf.colorTransform.blueOffset', 0)
            setProperty('boyfriend.colorTransform.greenOffset', 0)
            setProperty('boyfriend.colorTransform.redOffset', 0)
            setProperty('boyfriend.colorTransform.blueOffset', 0)
            setProperty('BnW bg.alpha', 0)
        end
    end
end