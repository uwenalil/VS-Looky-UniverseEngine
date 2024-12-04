function onCreate()
    makeLuaText('totakethetext', '', 1580, -125, -45)
    setTextFont('totakethetext', 'lunchds.ttf')
    setTextColor('totakethetext', 'ff0000')
    setTextSize('totakethetext', 62);
    setObjectCamera('totakethetext', 'camGame')
    setObjectOrder('totakethetext', getObjectOrder('dadGroup') - 1)
    setTextAlignment('totakethetext', 'left')
end

function onEvent(name, value1, value2)
    if name == "text" then
        healthbarToggle(true)
        setProperty('totakethetext.visible', true)
        setTextString('totakethetext', getProperty('totakethetext.text')..string.upper(value1)..' ')
        addLuaText('totakethetext')
        if value2 == 'tempClear' then
            setProperty('totakethetext.visible', false)
            healthbarToggle(false)
        elseif value2 == 'clear' then
            setTextString('totakethetext', '')
        end
    end
end

function healthbarToggle(porn)
    if porn == true then
        doTweenAlpha('bar1', 'healthBar', 0, 0.4, 'circInOut')
        doTweenAlpha('barbg', 'healthBarBG', 0, 0.4, 'circInOut')
        doTweenAlpha('bar2', 'staminaBar', 0, 0.4, 'circInOut')
    else
        doTweenAlpha('bar1', 'healthBar', 1, 0.4, 'circInOut')
        doTweenAlpha('barbg', 'healthBarBG', 1, 0.4, 'circInOut')
        doTweenAlpha('bar2', 'staminaBar', 1, 0.4, 'circInOut')
    end
end