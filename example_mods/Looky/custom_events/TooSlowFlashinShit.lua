function onCreate()
    makeAnimatedLuaSprite('FlashingShitTooSlow','daSTAT',0,0)
    addAnimationByPrefix('FlashingShitTooSlow','glitch','staticFLASH',24,false)
    setProperty('FlashingShitTooSlow.alpha',0.5)
    scaleObject('FlashingShitTooSlow',3.2,2.45)
    setObjectCamera('FlashingShitTooSlow','other')
end
function onUpdate()
    if getProperty('FlashingShitTooSlow.animation.curAnim.finished') == true then
        removeLuaSprite('FlashingShitTooSlow',false)
    end
end
function onEvent(name,v1)
    if name == 'TooSlowFlashinShit' then
        addLuaSprite('FlashingShitTooSlow',true)
        objectPlayAnimation('FlashingShitTooSlow','glitch',true)
        playSound('simplejumpsound')
    end
end