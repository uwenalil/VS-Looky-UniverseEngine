function onCreate()
    makeAnimatedLuaSprite('head', 'Head')
    addAnimationByPrefix('head', 'Headlol', 'Head Head')
    scaleObject('head', 2.02, 1.92)
    playAnim('head', 'Headlol')
    setObjectCamera('head', 'camHUD')
    screenCenter('head', 'x')
    removeLuaSprite('head', false)
end

function onEvent(eventName, value1, value2)
    if eventName == 'Mickey Head' then
        if tonumber(value1) == 0 and tonumber(value2) == 0 then
            removeLuaSprite('head')
        elseif value1 == '' and value2 == '' then
            addLuaSprite('head', true)
        else
            doTweenAlpha('alphalolo1', 'head', tonumber(value1), tonumber(value2), 'sineInOut')
        end
    end
end