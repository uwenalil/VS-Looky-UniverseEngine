function onCreatePost()
    precacheImage('specimen9/Alert')
    makeAnimatedLuaSprite('alerttt', 'song specific and bgs/specimen9/Alert', 0, 0)
        addAnimationByPrefix('alerttt', 'x1', 'Dodge once', 24, false)
        addAnimationByPrefix('alerttt', 'x2', 'Dodge 2 times', 24, false)
        addAnimationByPrefix('alerttt', 'x3', 'Dodge 3 times', 24, false)
        addAnimationByPrefix('alerttt', 'x2 short', 'Short dodge 2 times', 24, false)
        addAnimationByPrefix('alerttt', 'x1 short', 'Short dodge once', 24, false)
    screenCenter('alerttt', 'xy')
    updateHitbox('alerttt')
    setObjectCamera('alerttt', 'other')
    addLuaSprite('alerttt')
    setProperty('alerttt.visible', false)
end

function onEvent(n,v1,v2)
    if n == 'dodgeWarning' and getPropertyFromClass('ClientPrefs', 'mechanics') then
        if v1 == 'x1' then
            makeAlert(v1)
            runTimer('kill', 3.58)
            --[[ timestamps
            dodge press: 2.75
            animation end: 3.58
            ]]
        elseif v1 == 'x2' then
            makeAlert(v1)
            runTimer('kill', 4.46)
            --[[ timestamps
            dodge press: 3.42
            animation end: 4.46
            ]]
        elseif v1 == 'x3' then
            makeAlert(v1)
            runTimer('kill', 4.46)
            --timestamps are the same as x2
        elseif v1 == 'x2 short' then
            makeAlert(v1)
            runTimer('kill', 2.08)
            --[[ timestamps
            dodge press: 1.54
            animation end: 2.08
            ]]
        elseif v1 == 'x1 short' then
            makeAlert(v1)
            runTimer('kill', 1.50)
            --[[ timestamps
            dodge press: 0.96
            animation end: 1.50
            ]]
        end
    end
end

function makeAlert(piss)
    setProperty('alerttt.visible', true)
    objectPlayAnimation('alerttt', piss, true)
end

function onTimerCompleted(t,l,ll)
    if t == 'kill' then
        setProperty('alerttt.visible', false)
    end
end