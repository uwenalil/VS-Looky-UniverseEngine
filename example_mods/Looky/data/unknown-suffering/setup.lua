function onCreate()
    setProperty("skipCountdown", true)

    makeLuaSprite('VignetteLight', 'suicideStreet/vignetteLight', 0, 0)
    scaleLuaSprite('VignetteLight', 1, 1)
    setScrollFactor('VignetteLight', 1, 1)
    setObjectCamera('VignetteLight', 'hud')
    addLuaSprite('VignetteLight', true)
    setProperty('VignetteLight.alpha', 0)

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

    makeLuaSprite('BGbroken', 'suicideStreet/streetBroken', -1100, -200)
	scaleLuaSprite('BGbroken', 1, 1)
	setScrollFactor('BGbroken', 1, 1)
	addLuaSprite('BGbroken', false)
    setProperty('BGbroken.visible', false)

    makeLuaSprite('BGend', 'suicideStreet/streetVeryBroken', -1100, -200)
	scaleLuaSprite('BGend', 1, 1)
	setScrollFactor('BGend', 1, 1)
	addLuaSprite('BGend', false)
    setProperty('BGend.visible', false)

    makeLuaSprite('light', 'suicideStreet/light', -800, -200)
	scaleLuaSprite('light', 0.85, 1)
	setScrollFactor('light', 0.8, 1)
	addLuaSprite('light', false)
    setProperty('light.alpha', 0)

    makeLuaSprite('void', '', -200, -200)
    makeGraphic('void', 3000, 2000, '000000')
    setScrollFactor('void', 0, 0)
    addLuaSprite('void', true)
    setProperty('void.alpha', 1)

    setProperty('gf.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('camHUD.alpha', 0)
    setProperty('showComboNum', false)
    setProperty('showRating', false)

    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('healthBar.alpha', 0)
    setProperty('healthBarBG.alpha', 0)

    drain = 0
    shake = 0
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    cameraShake('game', shake, 0.05)
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health - drain);
    end
end

function onSectionHit()
    if curSection == 8 then
        doTweenAlpha('voidtween', 'void', 0.2, 4.8)
    end

    if curSection == 24 then
        setProperty('health', 1)
        doTweenAlpha('BGdarktween', 'BGdark', 1, 2.4)
        doTweenAlpha('iconP1tween', 'iconP1', 1, 2.4)
        doTweenAlpha('iconP2tween', 'iconP2', 1, 2.4)
        doTweenAlpha('healthBartween', 'healthBar', 1, 2.4)
        doTweenAlpha('healthBarBG', 'healthBarBG', 1, 2.4)
        setProperty('defaultCamZoom', 0.75)
    end

    if curSection == 32 then
        doTweenZoom('camGameTween', 'camGame', 1.25, 9.6)
    end

    if curSection == 40 then
        drain = 0.025
        shake = 0.0075
        setProperty('defaultCamZoom', 0.8)
        setProperty('BGdark.alpha', 0)
    end

    if curSection == 56 then
        setProperty('BGbroken.visible', true)
    end

    if curSection == 89 then
        setProperty('defaultCamZoom', 1.2)
    end

    if curSection == 113 then
        setProperty('defaultCamZoom', 0.8)
    end

    if curSection == 153 then
        setProperty('void.alpha', 1)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
    end

    if curSection == 154 then
        setProperty('void.alpha', 0)
        setProperty('defaultCamZoom', 1.15)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
    end

    if curSection == 202 then
        setProperty('void.alpha', 1)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
    end

    if curSection == 219 then
        setProperty('void.alpha', 0)
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('BGend.visible', true)
        setProperty('health', 2)
        setProperty('defaultCamZoom', 0.75)
        drain = 0.022
    end

    if curSection == 235 then
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0.75, 1.2)
    end

    if curSection == 251 then
        doTweenAlpha('lighttween', 'light', 0.5, 4.8)
        doTweenZoom('camGameTween', 'camGame', 1.1, 19.2)
    end

    if curSection == 267 then
        setProperty('defaultCamZoom', 1.2)
    end

    if curSection == 283 then
        doTweenAlpha('voidtween', 'void', 1, 1.2)
        doTweenAlpha('VignetteLighttween', 'VignetteLight', 0, 1.2)
        doTweenAlpha('healthBartween', 'healthBar', 0, 1.2)
        doTweenAlpha('healthBarBG', 'healthBarBG', 0, 1.2)
        drain = 0
    end
end