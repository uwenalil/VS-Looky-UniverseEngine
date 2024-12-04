--Script by xTHFx--
--Give Credits If You Use It--
function onCreate()
	makeLuaSprite('cycle', '', 0, 0)
	makeGraphic('cycle', screenWidth, screenHeight, getProperty('boyfriend.color'))--I Dont Know Why haha(I Got It :v)(BF Tweens Work Perfectly)--
	setObjectOrder('cycle', 0)
	setProperty('cycle.alpha', 0)
	setObjectCamera('cycle', 'hud');
	
	addLuaSprite('cycle', false)

	makeLuaSprite('cyclecolor', '', screenWidth, screenHeight - 9999)
	setObjectOrder('cyclecolor', 0)
	setProperty('cyclecolor.alpha', 0)
	setObjectCamera('cyclecolor', 'hud');
	
	addLuaSprite('cyclecolor', false)
end
function onEvent(name, value1, value2)
	if name == 'Time Cycle' then
	if value1 == 'day' then
		doTweenColor('cycleday', 'cyclecolor', 'FFFFFF', value2, 'linear');
		doTweenAlpha('cycledayalpha', 'cycle', 0, value2, 'linear');
	end
	if value1 == 'sunset' then
		doTweenColor('cyclesunset', 'cyclecolor', 'ff7f27', value2, 'linear');
		doTweenAlpha('cyclesunsetalpha', 'cycle', 0.15, value2, 'linear');
	end
	if value1 == 'night' then
		doTweenColor('cyclenight', 'cyclecolor', '000000', value2, 'linear');
		doTweenAlpha('cyclenightalpha', 'cycle', 0.5, value2, 'linear');
	end
end
end
function onUpdate(elapsed)
	setProperty('cycle.color', getProperty('cyclecolor.color'))
end