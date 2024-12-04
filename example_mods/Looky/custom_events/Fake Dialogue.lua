function onCreatePost() -- make it now so it doesn't lag when triggered
    precacheImage('speech_bubble')
    precacheImage('dialogue/BF_Dialogue') -- you'll probably use them soo
    precacheImage('dialogue/GF_Dialogue')

    makeAnimatedLuaSprite('diaBox', 'speech_bubble', 50, 370)
    addAnimationByPrefix('diaBox', 'open', 'Speech Bubble Normal Open', 24, false)
    addAnimationByPrefix('diaBox', 'idle', 'speech bubble normal0')

    addAnimationByPrefix('diaBox', 'openMid', 'Speech Bubble Middle Open', 24, false)
    addAnimationByPrefix('diaBox', 'idleMid', 'speech bubble middle0')

    addAnimationByPrefix('diaBox', 'shkOpen', 'speech bubble loud open0', 24, false)
    addAnimationByPrefix('diaBox', 'shkIdle', 'AHH speech bubble0')

    addAnimationByPrefix('diaBox', 'shkOpenMid', 'speech bubble Middle loud open', 24, false)
    addAnimationByPrefix('diaBox', 'shkIdleMid', 'AHH Speech Bubble middle0')

    setObjectCamera('diaBox', 'hud')
    setObjectOrder('diaBox', getObjectOrder('healthBar') + 5)

    addLuaSprite('diaBox', true)
    setProperty('diaBox.visible', false)
    setProperty('diaBox.flipX', true)

    makeLuaText('fakeTxt', '', 1100, 100, 500)
    setObjectCamera('fakeTxt', 'hud');
    setObjectOrder('fakeTxt', getObjectOrder('diaBox') + 5)
    setTextColor('fakeTxt', '0x000000')
    setTextSize('fakeTxt', 50);
    setTextBorder('fakeTxt', 2, 'ffffff')
    addLuaText('fakeTxt');
    setTextFont('fakeTxt', "PhantomMuff Full Letters 1.1.5.ttf");
    setTextAlignment('fakeTxt', 'left');
end

local diaTable = {}
local diaTable2 = {}

local hold = {}
local stop = false

local inDia = false
local thing = 0
yappin = ''
local play = ''
local lastCalled = ''  -- person talking
local lastCalled2 = '' -- Char Portrait
local lastCalled3 = '' -- Animation

function onEvent(name, value1, value2)
    if name == 'Fake Dialogue' then
        diaTable = Split(value1, ',')
        diaTable2 = Split(value2, ',')
        -- text, who talks, box state (SHOCKED or normal) 1 or 2
        -- length, char portrait, animXML

        --debugPrint(diaTable, diaTable2) 

        thing = 0
        yappin = ''
        play = ''
        setTextString('fakeTxt', '')
        setProperty('fakeTxt.visible', true)

        hold = {}
        guh = diaTable[1]
        for letter in guh:gmatch(".") do table.insert(hold, letter) end

        check = tonumber(diaTable[3])
        if check == 1 then shocked = true else shocked = false end
        --debugPrint(hold)
        --debugPrint(lastCalled, lastCalled2)

        if lastCalled ~= diaTable[2] or lastCalled2 ~= diaTable2[2] or lastCalled3 ~= diaTable2[3] then
            if diaTable[2] == 'dad' then
                setProperty('diaBox.flipX', true)

                makeAnimatedLuaSprite('fakePeep', 'dialogue/' ..diaTable2[2], -500, 100)
                addAnimationByPrefix('fakePeep', 'idle', '' ..diaTable2[3])
                setObjectCamera('fakePeep', 'hud')
                setProperty('fakePeep.alpha', 0.1)
                --setProperty('fakePeep.flipX', true)
                setObjectOrder('fakePeep', getObjectOrder('diaBox') - 1)
                addLuaSprite('fakePeep', true)

                --scaleObject('fakePeep', 2.5, 2.5)
                doTweenX('slidIn', 'fakePeep', 50, 0.2, 'linear')
                doTweenAlpha('peepin', 'fakePeep', 1, 0.2, 'linear')

            elseif diaTable[2] == 'bf' then
                setProperty('diaBox.flipX', false)

                makeAnimatedLuaSprite('fakePeep', 'dialogue/' ..diaTable2[2], 1500, 100)
                addAnimationByPrefix('fakePeep', 'idle', '' ..diaTable2[3])
                setObjectCamera('fakePeep', 'hud')
                setProperty('fakePeep.alpha', 0.1)
                setObjectOrder('fakePeep', getObjectOrder('diaBox') - 1)
                addLuaSprite('fakePeep', true)

                doTweenX('slidIn', 'fakePeep', 820, 0.2, 'linear')
                doTweenAlpha('peepin', 'fakePeep', 1, 0.2, 'linear')
                
            else
                setProperty('diaBox.flipX', false)

                makeAnimatedLuaSprite('fakePeep', 'dialogue/' ..diaTable2[2], -200, 100)
                addAnimationByPrefix('fakePeep', 'idle', '' ..diaTable2[3])
                setObjectCamera('fakePeep', 'hud')
                setProperty('fakePeep.alpha', 0.1)
                setObjectOrder('fakePeep', getObjectOrder('diaBox') - 1)
                addLuaSprite('fakePeep', true)

                setProperty('fakePeep.flipX', true)
                doTweenX('slidIn', 'fakePeep', (screenWidth / 2) - getProperty('fakePeep.width') / 1.8, 0.2, 'linear')
                doTweenAlpha('peepin', 'fakePeep', 1, 0.2, 'linear')

                play = 'Mid'
            end
            lastCalled = diaTable[2]
            lastCalled2 = diaTable2[2]
            lastCalled3 = diaTable2[3]
        end
        -- if 2 middles in a row
        if lastCalled ~= 'bf' and lastCalled ~= 'dad' then play = 'Mid' end

        length = tonumber(diaTable2[1])
        if length <= 0 then
            length = 1 end
        
        if getProperty('diaBox.visible') ~= true then
            if shocked then
                if play ~= 'Mid' then
                    setProperty('diaBox.x', 20) 
                    setProperty('diaBox.y', 310)
                else
                    setProperty('diaBox.x', 20) 
                    setProperty('diaBox.y', 330)
                end
                objectPlayAnimation('diaBox', 'shkOpen'..play)
            else
                if play ~= 'Mid' then
                    setProperty('diaBox.x', 50) 
                    setProperty('diaBox.y', 370)
                else
                    setProperty('diaBox.x', 50) 
                    setProperty('diaBox.y', 380)
                end
                objectPlayAnimation('diaBox', 'open'..play)
            end
        end
        if inDia then
            if shocked then
                if play ~= 'Mid' then
                    setProperty('diaBox.x', 20) 
                    setProperty('diaBox.y', 310)
                else
                    setProperty('diaBox.x', 20) 
                    setProperty('diaBox.y', 330)
                end
                objectPlayAnimation('diaBox', 'shkIdle'..play)
            else
                if play ~= 'Mid' then
                    setProperty('diaBox.x', 50) 
                    setProperty('diaBox.y', 370)
                else
                    setProperty('diaBox.x', 50) 
                    setProperty('diaBox.y', 380)
                end
                objectPlayAnimation('diaBox', 'idle'..play)
            end
        end
    
        setProperty('diaBox.visible', true)
        inDia = true
        stop = false
        playSound('dialogue', 1)
        runTimer('addTx', 0.15) -- so text ain't floating there before the textbox shows
        runTimer('leave', length)
    end
end

function onTimerCompleted(t, l, ll)
    if t == 'leave' then
        inDia = false
        removeLuaSprite('fakePeep', true)
        setTextString('fakeTxt', '')
        setProperty('fakeTxt.visible', false)

        if shocked then
            playAnim('diaBox', 'shkOpen'..play, true, true)
        else
            playAnim('diaBox', 'open'..play, true, true)
        end
        runTimer('bep', 0.15)
        playSound('dialogueClose', 1)
    end

    if t == 'bep' then
        setProperty('diaBox.visible', false)
    end

    if t == 'addTx' then
        setTextString('fakeTxt', diaTable[1])
        if #hold ~= thing then
            thing = thing + 1 else
                stop = true
        end

        if not stop then
            yappin = yappin .. hold[thing]
            playSound('dialogue', 1) end


        if inDia then
            setTextString('fakeTxt', yappin)
            runTimer('addTx', 0.05) end
    end
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end

function onUpdate()
    diaAni = getProperty('diaBox.animation.curAnim.name')
    if shocked then
        if (diaAni == 'shkOpen' or diaAni == 'shkOpenMid') and getProperty('diaBox.animation.curAnim.finished') then        
            objectPlayAnimation('diaBox', 'shkIdle'..play)
        end
    else
        if (diaAni == 'open' or diaAni == 'openMid') and getProperty('diaBox.animation.curAnim.finished') then        
            objectPlayAnimation('diaBox', 'idle'..play)
        end
    end

    if not inDia then 
        lastCalled = '' 
        lastCalled2 = '' 
        lastCalled3 = '' end
end