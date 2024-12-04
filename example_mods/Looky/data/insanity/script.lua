function onCreatePost()
	setProperty('dad.visible', false)
	setPropertyFromClass('GameOverSubstate', 'characterName', 'tails-dead');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'no');
--- Down there isn't the middlescroll-forcing script
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('scoreTxt.visible', false)
--- Down there is the middlescroll-forcing script
	if not middlescroll then
        setPropertyFromGroup('opponentStrums', 0, 'x', -5000)
        setPropertyFromGroup('opponentStrums', 1, 'x', -5000)
        setPropertyFromGroup('opponentStrums', 2, 'x', -5000)
        setPropertyFromGroup('opponentStrums', 3, 'x', -5000)

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 240)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 220)
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 200)
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 180)
	end
	setProperty('introSoundsSuffix', 'suffix')
end

function onStepHit()
	if curStep == 192 then
		triggerEvent('Camera Follow Pos', 900, 600)
		doTweenZoom('zoom', 'camGame', 1, 1, 'cubeOut')
	end
	if curStep == 256 then
		triggerEvent('Camera Follow Pos', '', '')
		doTweenZoom('zoom', 'camGame', 0.6, 1, 'cubeOut')
	end
	if curStep == 1336 then
		setProperty('camGame.visible', false)
	end
	if curStep == 1344 then
		setProperty('camGame.visible', true)
		triggerEvent('Camera Follow Pos', 1000, 700)
		doTweenZoom('zoom', 'camGame', 1.5, 4.8, 'cubeOut')
	end
end

function onStartCountdown()
	if not allowCountdown then
		runTimer('startText', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('blackscreen', 'blackscreen', 0, 0);
		setObjectCamera('blackscreen', 'other');
		addLuaSprite('blackscreen', true);
		makeLuaSprite('circle', 'Insanity/CircleInsanity', 720, 0);
		setObjectCamera('circle', 'other');
		addLuaSprite('circle', true);
		makeLuaSprite('text', 'Insanity/TextInsanity', -1280, 0);
		setObjectCamera('text', 'other');
		addLuaSprite('text', true);
		makeLuaSprite('bars', 'bars', 0, 0);
		setObjectCamera('bars', 'other');
		addLuaSprite('bars', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
	elseif tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.5, 'linear');
		doTweenX('texttween', 'text', 0, 0.5, 'linear');
	elseif tag == 'fadeout' then
		doTweenAlpha('circlefade', 'circle', 0, 1, 'linear');
		doTweenAlpha('textfade', 'text', 0, 1, 'linear');
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	end
end