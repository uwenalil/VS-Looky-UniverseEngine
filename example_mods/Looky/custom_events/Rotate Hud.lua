function onEvent(eventName, value1, value2) --code by ADA
    if eventName == 'Rotate Hud' then
        setProperty('timeBar.angle', value1)
        doTweenAngle('HUDTween2', 'timeBar', 0, value2, backIn)

        setProperty('timeTxt.angle', value1)
        doTweenAngle('HUDTween', 'timeTxt', 0, value2, backIn)
        
        setProperty('iconP1.angle', value1)
        doTweenAngle('HUDTween22', 'iconP1', 0, value2, backIn)

        setProperty('iconP2.angle', value1)
        doTweenAngle('HUDTween222', 'iconP2', 0, value2, backIn)

        setProperty('healthBar.angle', value1)
        doTweenAngle('HUDTween2222', 'healthBar', 0, value2, backIn)

        setProperty('healthBarBG.angle', value1)
        doTweenAngle('HUDTween22222', 'healthBarBG', 0, value2, backIn)

        setProperty('scoreTxt.angle', value1)
        doTweenAngle('HUDTween222222', 'scoreTxt', 0, value2, backIn)

        setProperty('camGame.angle', value1)
        doTweenAngle('HUDTween2222222', 'camGame', 0, value2, backIn)

        triggerEvent('Spin Notes', 0.05, 'ok')

        doTweenZoom('fucker', 'camGame', getProperty('defaultCamZoom') + 0.07, 0.05, backIn)

end
end

function onTweenComplete(tag)
	if tag == 'fucker' then
	doTweenZoom('fucker2', 'camGame', 1, 0.15, backOut)
	end

    return tag
end