function onCreate()
    makeAnimatedLuaSprite('sonicBoo','sonicJUMPSCARE',100,0)
    addAnimationByPrefix('sonicBoo','boo','sonicSPOOK',24,false)
    setProperty('sonicBoo.alpha',0.001)
    setObjectCamera('sonicBoo','other')
    addLuaSprite('sonicBoo',true)
end
function onUpdate()
    if getProperty('sonicBoo.animation.curAnim.finished') then
        removeLuaSprite('sonicBoo',false)

    end
end
function onEvent(name)
    if name == 'sonicspook' then
        addLuaSprite('sonicBoo',true)
        setProperty('sonicBoo.alpha',1)
        playSound('datOneSound')
        objectPlayAnimation('sonicBoo','boo',true)
    end
end