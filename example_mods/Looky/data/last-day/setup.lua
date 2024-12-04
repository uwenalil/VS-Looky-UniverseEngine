function onCreate()
    setProperty("skipCountdown", true)
    setProperty('health', 0.4)

    makeLuaSprite('VignetteLight', 'suicideStreet/vignetteLight', 0, 0)
    scaleLuaSprite('VignetteLight', 1, 1)
    setScrollFactor('VignetteLight', 1, 1)
    setObjectCamera('VignetteLight', 'hud');
    addLuaSprite('VignetteLight', true)
    setProperty('VignetteLight.alpha', 0)

    makeLuaSprite('Vignette', 'suicideStreet/vignette', 0, 0)
    scaleLuaSprite('Vignette', 1, 1)
    setScrollFactor('Vignette', 1, 1)
    setObjectCamera('Vignette', 'other');
    addLuaSprite('Vignette', false)

	makeLuaSprite('Vision', 'suicideStreet/streetVeryBroken', -1000, -200)
	scaleLuaSprite('Vision', 1, 1)
	setScrollFactor('Vision', 1, 1)
	addLuaSprite('Vision', false)
    setProperty('Vision.alpha', 0)

    makeLuaSprite('void', '', -200, -200)
    makeGraphic('void', 1920, 1080, '000000')
    setScrollFactor('void', 0, 0)
    addLuaSprite('void', true)
    setProperty('void.alpha', 1)

    setProperty('gf.visible', false)
    setProperty('scoreTxt.alpha', 0)
    setProperty('showComboNum', false)
    setProperty('showRating', false)
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('camHUD.alpha', 0)
    doTweenZoom('camGameTween', 'camGame', 0.75, 18.11)
    doTweenAlpha('voidtween', 'void', 0.3, 4.53)
end

function onSectionHit()
    if curSection == 8 then
        setProperty('defaultCamZoom', 1)
    end

    if curSection == 10 then
        doTweenZoom('camGameTween', 'camGame', 0.8, 13.58)
    end
    
    if curSection == 16 then
        setProperty('defaultCamZoom', 1.2)
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.15 then
                setProperty('health', health - 0.02);
            end
        end
    end

    if curSection == 18 then
        doTweenZoom('camGameTween', 'camGame', 0.75, 13.58)
    end

    if curSection == 32 then
        doTweenZoom('camGameTween', 'camGame', 0.7, 36.23)
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0.2, 2.26)
    end

    if curSection == 33 then
        setProperty('defaultCamZoom', 0.7)
    end

    if curSection == 48 then
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.15 then
                setProperty('health', health - 0.023);
            end
        end
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0.6, 2.26)
    end

    if curSection == 56 then
        doTweenZoom('camGameTween', 'camGame', 0.9, 18.11)
    end
    
    if curSection == 64 then
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0, 2.26)
        setProperty('defaultCamZoom', 1.1)
        doTweenAlpha('Visiontween', 'Vision', 1, 2.26)
    end

    if curSection == 68 then
        doTweenZoom('camGameTween', 'camGame', 0.8, 18.11)
    end

    if curSection == 72 then
        doTweenZoom('camGameTween', 'camGame', 1.2, 18.11)
    end

    if curSection == 80 then
        setProperty('defaultCamZoom', 1.2)
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0.3, 2.26)
    end

    if curSection == 88 then
        setProperty('defaultCamZoom', 0.8)
        setProperty('Vision.alpha', 0)
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 1, 2.26)
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.15 then
                setProperty('health', health - 0.02);
            end
        end
    end

    if curSection == 96 then
        doTweenZoom('camGameTween', 'camGame', 1.2, 18.11)
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.15 then
                setProperty('health', health - 0.044);
            end
        end
    end

    if curSection == 104 then
        setProperty('defaultCamZoom', 0.9)
        doTweenAlpha('Visiontween', 'Vision', 1, 2.26)
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0, 2.26)
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.15 then
                setProperty('health', health - 0.0245);
            end
        end
    end

    if curSection == 112 then
        doTweenAlpha('voidtween', 'void', 1, 4.53)
    end
end
