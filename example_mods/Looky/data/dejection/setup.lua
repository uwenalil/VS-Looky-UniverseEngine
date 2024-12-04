function onCreate()
    setProperty("skipCountdown", true)

    makeLuaSprite('Vignette', 'suicideStreet/vignette', 0, 0)
    scaleLuaSprite('Vignette', 1, 1)
    setScrollFactor('Vignette', 1, 1)
    setObjectCamera('Vignette', 'other');
    addLuaSprite('Vignette', false)

    makeLuaSprite('BGdark', 'suicideStreet/streetDark', -1100, -200)
	scaleLuaSprite('BGdark', 1, 1)
	setScrollFactor('BGdark', 1, 1)
	addLuaSprite('BGdark', false)
    setProperty('BGdark.alpha', 0)

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
    doTweenZoom('camGameTween', 'camGame', 1.2, 13.71)
    doTweenAlpha('voidtween', 'void', 0.2, 3.43)
end

function onSectionHit()
    if curSection == 8 then
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.15 then
                setProperty('health', health - 0.015);
            end
        end
    end

    if curSection == 71 then
        doTweenZoom('camGameTween', 'camGame', 1.3, 3.43)
    end

    if curSection == 73 then
        setProperty('defaultCamZoom', 0.8)
        doTweenAlpha('BGdarktween', 'BGdark', 1, 3.43)
    end

    if curSection == 77 then
        doTweenZoom('camGameTween', 'camGame', 1, 6.86)
    end

    if curSection == 78 then
        setProperty('defaultCamZoom', 1)
    end

    if curSection == 85 then
        doTweenZoom('camGameTween', 'camGame', 1.3, 6.86)
    end
        
    if curSection == 89 then
        setProperty('defaultCamZoom', 1.3)
    end

    if curSection == 112 then
        setProperty('defaultCamZoom', 0.8)
    end

    if curSection == 113 then
        setProperty('defaultCamZoom', 0.9)
    end

    if curSection == 161 then
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.25 then
                setProperty('health', health - 0);
            end
        end
        setProperty('defaultCamZoom', 0.9)
        doTweenAlpha('BGdarktween', 'BGdark', 0, 3.43)
    end
    
    if curSection == 163 then
        doTweenZoom('camGameTween', 'camGame', 1.3, 10.29)
    end

    if curSection == 169 then
        setProperty('defaultCamZoom', 1.3)
        doTweenAlpha('voidtween', 'void', 1, 3.43)
    end
end

