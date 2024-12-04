function onCreate()
    precacheImage('Alert');
end

function onSongStart()
    --did this on onSongStart so you cant dodge before song starts
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
    staminaLoss = 0.2;
    staminaGain = 0.01
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" and getPropertyFromClass('ClientPrefs', 'mechanics') then
        DodgeTime = (value1);

        triggerEvent('Play Animation', 'attack', 'dad')
        
        canDodge = true;
        runTimer('Died', DodgeTime);
	end
end

function onUpdate()
    if canDodge == true and keyJustPressed('space') and getProperty('stamina') > staminaLoss and getPropertyFromClass('ClientPrefs', 'mechanics') then
        doDodge(true)
    elseif canDodge == false and keyJustPressed('space') and getProperty('stamina') > 0.15 and getProperty('cpuControlled') == false and getPropertyFromClass('ClientPrefs', 'mechanics') then
        doDodge(false)
    elseif canDodge == true and getProperty('cpuControlled') and getPropertyFromClass('ClientPrefs', 'mechanics') then
        doDodge(true)
    end
end

function doDodge(hadtododge)
    if hadtododge then
        Dodged = true;
        canDodge = false
        setProperty('stamina', getProperty('stamina') - staminaLoss)
        if getRandomInt(1,2) == 1 then
            triggerEvent('Play Animation', 'dodgeLeft', 'bf');
            cancelTween('bfBack')
            cancelTimer('leftBack')
            setProperty('boyfriend.x', 150)
            doTweenX('bfMoveLeft', 'boyfriend', -350, 0.2, 'quadInOut')
            runTimer('leftBack', 0.3)
        else
            triggerEvent('Play Animation', 'dodgeRight', 'bf');
            cancelTween('bfBack')
            cancelTimer('rightBack')
            setProperty('boyfriend.x', 150)
            doTweenX('bfMoveRight', 'boyfriend', 650, 0.2, 'quadInOut')
            runTimer('rightBack', 0.3)
        end
    else
        setProperty('stamina', getProperty('stamina') - staminaLoss * 1.15)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'Died' and Dodged == false and getPropertyFromClass('ClientPrefs', 'mechanics') then
        setProperty('health', 0);
    elseif tag == 'Died' and Dodged == true and getPropertyFromClass('ClientPrefs', 'mechanics') then
        Dodged = false
    end
    if tag == 'leftBack' then
        doTweenX('bfBack', 'boyfriend', 150, 0.75, 'quadInOut')
    elseif tag == 'rightBack' then
        doTweenX('bfBack', 'boyfriend', 150, 0.75, 'quadInOut')
    end
end

function goodNoteHit()
    setProperty('stamina', getProperty('stamina') + staminaGain)
end

function onBeatHit()
    if curBeat == 316 and songName == 'Full Body Amputation' then
        staminaLoss = 0.45
        staminaGain = 0.038
    end
end