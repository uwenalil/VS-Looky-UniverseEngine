colors = {'0xFF31A2FD', '0xFF31FD8C', '0xFFF794F7', '0xFFF96D63', '0xFFFBA633'}


local curLightEvent = 0

function onCreatePost()

	--black bg
	makeLuaSprite('blammedLightsBlack', '', getPropertyFromClass('flixel.FlxG', 'width') * -0.5, getPropertyFromClass('flixel.FlxG', 'height') * -0.5)
	makeGraphic('blammedLightsBlack', getPropertyFromClass('flixel.FlxG', 'width') * 2, getPropertyFromClass('flixel.FlxG', 'height') * 2, '000000')
	
	setScrollFactor('blammedLightsBlack', 0)
	setProperty('blammedLightsBlack.scale.x', 5)
	setProperty('blammedLightsBlack.scale.y', 5)

	if getProperty('gf.visible') == true then
		setObjectOrder('blammedLightsBlack', getObjectOrder('gfGroup'))
	elseif getProperty('dad.visible') == true then
		setObjectOrder('blammedLightsBlack', getObjectOrder('dadGroup'))
	else
		setObjectOrder('blammedLightsBlack', getObjectOrder('boyfriendGroup'))
	end

	addLuaSprite('blammedLightsBlack', false)

	setProperty('blammedLightsBlack.alpha', 0)


	--city windows
	if getPropertyFromClass('PlayState', 'curStage') == 'encounter' or getPropertyFromClass('PlayState', 'curStage') == 'encounter-remix' then

		makeLuaSprite('light', 'encounter bg/back', -80, -150)

		if getProperty('gf.visible') == true then
			setObjectOrder('light', getObjectOrder('gfGroup'))
		elseif getProperty('dad.visible') == true then
			setObjectOrder('light', getObjectOrder('dadGroup'))
		else
			setObjectOrder('light', getObjectOrder('boyfriendGroup'))
		end

		scaleObject('light', 1.2, 1.2)

		addLuaSprite('light', false)

		setProperty('light.alpha', 0)



		makeLuaSprite('light2', 'encounter bg/DoorOpen', -25, -80)

		if getProperty('gf.visible') == true then
			setObjectOrder('light2', getObjectOrder('gfGroup'))
		elseif getProperty('dad.visible') == true then
			setObjectOrder('light2', getObjectOrder('dadGroup'))
		else
			setObjectOrder('light2', getObjectOrder('boyfriendGroup'))
		end

		scaleObject('light2', 1.05, 1.1)

		addLuaSprite('light2', false)

		setProperty('light2.alpha', 0)

		


		makeLuaSprite('light3', 'encounter bg/Window1', 100, -60)

		if getProperty('gf.visible') == true then
			setObjectOrder('light3', getObjectOrder('gfGroup'))
		elseif getProperty('dad.visible') == true then
			setObjectOrder('light3', getObjectOrder('dadGroup'))
		else
			setObjectOrder('light3', getObjectOrder('boyfriendGroup'))
		end

		addLuaSprite('light3', false)

		setProperty('light3.alpha', 0)



		makeLuaSprite('light4', 'encounter bg/Curtains', 50, -100)

		if getProperty('gf.visible') == true then
			setObjectOrder('light4', getObjectOrder('gfGroup'))
		elseif getProperty('dad.visible') == true then
			setObjectOrder('light4', getObjectOrder('dadGroup'))
		else
			setObjectOrder('light4', getObjectOrder('boyfriendGroup'))
		end

		scaleObject('light4', 1.05, 1.1)

		addLuaSprite('light4', false)

		setProperty('light4.alpha', 0)



		makeLuaSprite('light5', 'encounter bg/Coach', 250, -100)

		if getProperty('gf.visible') == true then
			setObjectOrder('light5', getObjectOrder('gfGroup'))
		elseif getProperty('dad.visible') == true then
			setObjectOrder('light5', getObjectOrder('dadGroup'))
		else
			setObjectOrder('light5', getObjectOrder('boyfriendGroup'))
		end

		scaleObject('light5', 1.05, 1.1)

		addLuaSprite('light5', false)

		setProperty('light5.alpha', 0)

	end

end

function onEvent(name, value1)

	if name == 'lights-notdad' then

		local lightId = tonumber(value1)
		if lightId == nil then lightId = 0 end

		if lightId > 0 then

			if lightId > #colors then
				lightId = getRandomInt(1, #colors, tostring(curLightEvent))
			end

			curLightEvent = lightId

			if getProperty('blammedLightsBlack.alpha') == 0 then

				doTweenAlpha('blammedLightsBlackTween', 'blammedLightsBlack', 1, 0.0001, 'quadInOut')
				doTweenColor('boyfriendColorTween', 'boyfriend', colors[lightId], 0.0001, 'quadInOut')
				doTweenColor('gfColorTween', 'gf', colors[lightId], 0.0001, 'quadInOut')

			else

				setProperty('blammedLightsBlack.alpha', 1)
				doTweenColor('boyfriendColorTween', 'boyfriend', colors[lightId], 0.00000001, 'quadInOut')
				doTweenColor('gfColorTween', 'gf', colors[lightId], 0.00000001, 'quadInOut')

			end

			if getPropertyFromClass('PlayState', 'curStage') == 'encounter' or getPropertyFromClass('PlayState', 'curStage') == 'encounter-remix' then
				doTweenColor('1phillyCityLightsEventColor', 'light', colors[lightId], 0.00000001, 'quadInOut')
				doTweenAlpha('1phillyCityLightsEventAlpha', 'light', 1, 1, 'quadInOut')
				doTweenColor('2phillyCityLightsEventColor', 'light2', colors[lightId], 0.00000001, 'quadInOut')
				doTweenAlpha('2phillyCityLightsEventAlpha', 'light2', 1, 1, 'quadInOut')
				doTweenColor('3phillyCityLightsEventColor', 'light3', colors[lightId], 0.00000001, 'quadInOut')
				doTweenAlpha('3phillyCityLightsEventAlpha', 'light3', 1, 1, 'quadInOut')
				doTweenColor('4phillyCityLightsEventColor', 'light4', colors[lightId], 0.00000001, 'quadInOut')
				doTweenAlpha('4phillyCityLightsEventAlpha', 'light4', 1, 1, 'quadInOut')
				doTweenColor('5phillyCityLightsEventColor', 'light5', colors[lightId], 0.00000001, 'quadInOut')
				doTweenAlpha('5phillyCityLightsEventAlpha', 'light5', 1, 1, 'quadInOut')
			end

		else

			doTweenAlpha('blammedLightsBlackTween', 'blammedLightsBlack', 0, 0.0001, 'quadInOut')

			if getPropertyFromClass('PlayState', 'curStage') == 'encounter' or getPropertyFromClass('PlayState', 'curStage') == 'encounter-remix' then
				doTweenAlpha('5phillyCityLightsEventAlpha', 'light', 0, 0.0001, 'quadInOut')
				doTweenAlpha('4phillyCityLightsEventAlpha', 'light2', 0, 0.0001, 'quadInOut')
				doTweenAlpha('3phillyCityLightsEventAlpha', 'light3', 0, 0.0001, 'quadInOut')
				doTweenAlpha('2phillyCityLightsEventAlpha', 'light4', 0, 0.0001, 'quadInOut')
				doTweenAlpha('1phillyCityLightsEventAlpha', 'light5', 0, 0.0001, 'quadInOut')
			end
			
			doTweenColor('boyfriendColorTween', 'boyfriend', '0xffffffff', 0.0001, 'quadInOut')
			doTweenColor('gfColorTween', 'gf', '0xffffffff', 0.0001, 'quadInOut')

			curLightEvent = 0

		end

	end

	--disable the event on philly glow because it bugs out
	if name == 'Philly Glow' or name == 'Philly Glow Recreation' then
	
		cancelTween('boyfriendColorTween')
		cancelTween('dadColorTween')
		cancelTween('gfColorTween')

		if not (getProperty('blammedLightsBlack.alpha') == 0) and not (curLightEvent == 0) then

			doTweenAlpha('blammedLightsBlackTween', 'blammedLightsBlack', 0, 0.00000001, 'quadInOut')

			if getPropertyFromClass('PlayState', 'curStage') == 'encounter' then
				doTweenAlpha('5phillyCityLightsEventAlpha', 'light', 0, 0.00000001, 'quadInOut')
				doTweenAlpha('4phillyCityLightsEventAlpha', 'light2', 0, 0.00000001, 'quadInOut')
				doTweenAlpha('3phillyCityLightsEventAlpha', 'light3', 0, 0.00000001, 'quadInOut')
				doTweenAlpha('2phillyCityLightsEventAlpha', 'light4', 0, 0.00000001, 'quadInOut')
				doTweenAlpha('1phillyCityLightsEventAlpha', 'light5', 0, 0.00000001, 'quadInOut')
			end
			
			doTweenColor('boyfriendColorTween', 'boyfriend', '0xffffffff', 0.00000001, 'quadInOut')
			doTweenColor('gfColorTween', 'gf', '0xffffffff', 0.00000001, 'quadInOut')

			curLightEvent = 0

		end

	end

end